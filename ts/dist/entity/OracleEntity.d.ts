import { YesOrNoEntityBase } from '../YesOrNoEntityBase';
import type { YesOrNoSDK } from '../YesOrNoSDK';
import type { Control } from '../types';
import type { Oracle, OracleLoadMatch } from '../YesOrNoTypes';
declare class OracleEntity extends YesOrNoEntityBase<Oracle> {
    constructor(client: YesOrNoSDK, entopts: any);
    make(this: OracleEntity): OracleEntity;
    load(this: any, reqmatch?: OracleLoadMatch, ctrl?: Control): Promise<OracleEntity>;
}
export { OracleEntity };
