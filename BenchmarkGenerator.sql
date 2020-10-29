var detail_id number
/
EXEC Dbms_Output.put_line(:detail_id);

DECLARE
  RELEASE           VARCHAR2(32):='8.0';
  SPRINT            VARCHAR2(32):='255';
  REMARKS           VARCHAR2(150):='DxCG,MS-DRG,MIR,REV2.1,CyclePeriod-Jan17-Dec18';
  CLIENTID          VARCHAR2(32):='857';
  APPID             VARCHAR2(32):='857-001';
  SCHEMA_NAME       VARCHAR2(32):='OE0857001201023';
  SRC_SERVER        VARCHAR2(32):='dm02mi-scan.d2hawkeye.net';
  SRC_PORT          VARCHAR2(4):='1521';
  SRC_SERVICE       VARCHAR2(10):='etluatsrva';
  INCLUDE_HEDIS     VARCHAR(1):= 'N';

BEGIN
 -- pkg_new_benchmark.sp_create_dblink(SCHEMA_NAME,SRC_SERVER,SRC_PORT,SRC_SERVICE);
  pkg_benchmark.sp_load_bm_stats(RELEASE,SPRINT,REMARKS,CLIENTID,APPID,SCHEMA_NAME,SRC_SERVER,SRC_PORT,SRC_SERVICE,INCLUDE_HEDIS);
  EXECUTE IMMEDIATE
  'SELECT detail_id FROM bm_exec_details
  WHERE
  RELEASE ='''||RELEASE||''' AND
   SPRINT ='''||SPRINT||''' AND
  REMARKS ='''||REMARKS||''' AND
  CLIENTID ='''||CLIENTID||''' and
  APPID ='''||APPID||''' AND
  SCHEMA_NAME  = '''||SCHEMA_NAME||'''' INTO :DETAIL_ID;
END;
/
