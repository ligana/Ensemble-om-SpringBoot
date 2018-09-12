INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('CLOSE', '销户', '2', 'RB,CL,GL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('CRET', '贷记', '2', 'RB,GL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('CYCLE', '结息', '2', 'RB,CL,GL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('DEBT', '借记', '2', 'RB,GL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('DRW', '放款', '2', 'CL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('DUE', '到期', '2', 'CL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('GL', '内部账类', '1', '0');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('OPEN', '开户', '2', 'RB,CL,GL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('RB', '存款类', '1', '0');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('REC', '回收', '2', 'CL');
INSERT INTO MB_EVENT_CLASS (EVENT_CLASS,EVENT_CLASS_DESC,EVENT_CLASS_LEVEL,PARENT_EVENT_CLASS) VALUES ('RENEW', '转存', '2', 'RB');