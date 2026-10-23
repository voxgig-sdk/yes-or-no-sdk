import { OracleEntity } from './entity/OracleEntity';
export type * from './YesOrNoTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { YesOrNoEntityBase } from './YesOrNoEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class YesOrNoSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Oracle(entopts?: Record<string, any>): OracleEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): YesOrNoSDK;
    tester(testopts?: any, sdkopts?: any): YesOrNoSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof YesOrNoSDK;
export { stdutil, config, BaseFeature, YesOrNoEntityBase, YesOrNoSDK, SDK, };
export type { DirectResult };
