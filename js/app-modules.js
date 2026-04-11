import { firebaseConfig } from './config.js';
import { state } from './state.js';
import * as utils from './utils.js';
import * as firebase from './firebase.js';
import * as tags from './tags.js';
import * as nav from './nav.js';
import * as matching from './matching.js';
import * as render from './render.js';
import * as i18n from './i18n.js';
import * as renderfortest from './renderfortest.js';
import * as tutorial from './tutorial.js';
import * as landingRole from './landing-role.js';
import * as copyserial from './copyserial.js';
import * as emojiPicker from './emoji-picker.js';
import * as params from './params.js';

export function createAppModules() {
    firebase.initFirebase(firebaseConfig);

    return {
        state,
        utils,
        firebase,
        tags,
        nav,
        matching,
        render,
        i18n,
        renderfortest,
        tutorial,
        landingRole,
        copyserial,
        emojiPicker,
        params
    };
}

export function registerLegacyAppGlobals(appModules, target = globalThis) {
    if (!target) return appModules;
    target.WHO2MEET = appModules;
    return appModules;
}
