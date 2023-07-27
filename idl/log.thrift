// refer to  https://www.cloudwego.io/zh/docs/hertz/tutorials/toolkit/toolkit/

namespace go log_demo
namespace py log_demo
namespace java log_demo

enum Code {
     Success         = 1
     ParamInvalid    = 2
     DBErr           = 3
}

enum Result {
    success   = 0
    fail  = 1
}

struct Log {
    1: i64 id
    2: string action_type
    3: i64 status
    4: string   level
    5: i64 handle_time
    6: i64 created_time
    7: string created_by
    8: string external_id
    9: Result result
}

struct CreateLogRequest{
    1: string action_type      (api.body="action_type", api.form="action_type",api.vd="(len($) > 0 && len($) < 100)")
    2: string   level    (api.body="level", api.form="level",api.vd="(len($) > 0 && len($) < 100)")
    3: i64    handle_time       (api.body="handle_time", api.form="handle_time",api.vd="$>0")
    4: string created_by (api.body="created_by", api.form="created_by",api.vd="(len($) > 0 && len($) < 100)")
    5: Result result (api.body="success", api.form="success",api.vd="($ == 0||$ == 1)")
}

struct CreateLogResponse{
   1: Code code
   2: string msg
}

struct QueryLogRequest{
   1: optional string Keyword (api.body="keyword", api.form="keyword",api.query="keyword")
   2: i64 page (api.body="page", api.form="page",api.query="page",api.vd="$ > 0")
   3: i64 page_size (api.body="page_size", api.form="page_size",api.query="page_size",api.vd="($ > 0 || $ <= 100)")
}

struct QueryLogResponse{
   1: Log log
   2: string msg
   3: list<Log> logs
   4: i64 totoal
}

struct DeleteLogRequest{
   1: i64    id   (api.path="log_id",api.vd="$>0")
}

struct DeleteLogResponse{
   1: Code code
   2: string msg
}

struct UpdateLogRequest{
    1: i64    id   (api.path="id",api.vd="$>0")
    2: string action_type      (api.body="action_type", api.form="action_type",api.vd="(len($) > 0 && len($) < 100)")
    3: string   level    (api.body="level", api.form="level",api.vd="(len($) > 0 && len($) < 100)")
    4: i64    handle_time       (api.body="handle_time", api.form="handle_time",api.vd="$>0")
    5: string created_by (api.body="created_by", api.form="created_by",api.vd="(len($) > 0 && len($) < 100)")
    6: Result result (api.body="result", api.form="result",api.vd="($ == 0||$ == 1)")}

struct UpdateLogResponse{
   1: Code code
   2: string msg
}


service LogService {
   UpdateLogResponse UpdateLog(1:UpdateLogRequest req)(api.post="/v1/log/update/:log_id")
   DeleteLogResponse DeleteLog(1:DeleteLogRequest req)(api.post="/v1/log/delete/:log_id")
   QueryLogResponse  QueryLog(1: QueryLogRequest req)(api.post="/v1/log/query/")
   CreateLogResponse CreateLog(1:CreateLogRequest req)(api.post="/v1/log/create/")
}