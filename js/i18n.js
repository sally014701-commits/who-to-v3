import { translations } from './i18n-data.js';

const DEFAULT_LANG = 'ko';
const FALLBACK_LANG = 'en';
const TEXT_SELECTOR = '[data-i18n]';
const PLACEHOLDER_SELECTOR = '[data-i18n-placeholder]';

export class I18nService {
    constructor({ messages = {}, defaultLang = DEFAULT_LANG, fallbackLang = FALLBACK_LANG } = {}) {
        this.messages = messages;
        this.fallbackLang = this.hasLang(fallbackLang) ? fallbackLang : defaultLang;
        this.defaultLang = this.hasLang(defaultLang) ? defaultLang : this.fallbackLang;
        this.currentLang = this.defaultLang;
    }

    hasLang(lang) {
        return !!this.messages[lang];
    }

    getLang() {
        return this.currentLang;
    }

    setLang(lang) {
        if (this.hasLang(lang)) this.currentLang = lang;
        return this.currentLang;
    }

    translate(key, lang) {
        const targetLang = this.hasLang(lang) ? lang : this.currentLang;
        return this.messages[targetLang]?.[key] ?? this.messages[this.fallbackLang]?.[key] ?? key;
    }

    t(key, lang) {
        return this.translate(key, lang);
    }

    format(key, ...args) {
        let message = this.translate(key);
        args.forEach((arg, index) => {
            message = message.replace('%' + (index + 1), String(arg));
        });
        return message;
    }

    tf(key, ...args) {
        return this.format(key, ...args);
    }

    applyToPage(root = globalThis.document) {
        if (!root?.querySelectorAll) return;

        root.querySelectorAll(TEXT_SELECTOR).forEach((el) => {
            const key = el.getAttribute('data-i18n');
            if (key) el.textContent = this.translate(key);
        });

        root.querySelectorAll(PLACEHOLDER_SELECTOR).forEach((el) => {
            const key = el.getAttribute('data-i18n-placeholder');
            if (key && 'placeholder' in el) el.placeholder = this.translate(key);
        });
    }
}

export const i18n = new I18nService({ messages: translations });

export function getLang() {
    return i18n.getLang();
}

export function setLang(lang) {
    return i18n.setLang(lang);
}

export function t(key) {
    return i18n.translate(key);
}

export function tf(key, ...args) {
    return i18n.format(key, ...args);
}

export function applyToPage(root) {
    i18n.applyToPage(root);
}

export { translations };
