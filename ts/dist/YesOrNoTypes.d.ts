export interface Oracle {
    answer: string;
    forced: boolean;
    image: string;
    phrase: string;
    tool: string;
    verdict: string;
    word: string;
}
export interface OracleLoadMatch {
    force?: string;
    tool?: string;
}
