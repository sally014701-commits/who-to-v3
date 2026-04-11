import { createAppModules, registerLegacyAppGlobals } from './app-modules.js';
import { bootstrapApp } from './app-bootstrap.js';

const appModules = createAppModules();

registerLegacyAppGlobals(appModules);
bootstrapApp(appModules);
