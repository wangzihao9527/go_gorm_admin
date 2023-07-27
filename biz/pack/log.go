/*
 * Copyright 2022 CloudWeGo Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package pack

import (
	log_gorm "log_demo/biz/hertz_gen/log_gorm"
	"log_demo/biz/model"
)

// Users Convert model.User list to log_gorm.User list
func Logs(models []*model.Log) []*log_gorm.Log {
	logs := make([]*log_gorm.Log, 0, len(models))
	for _, m := range models {
		if u := Log(m); u != nil {
			logs = append(logs, u)
		}
	}
	return logs
}

// User Convert model.User to log_gorm.User
func Log(model *model.Log) *log_gorm.Log {
	if model == nil {
		return nil
	}
	return &log_gorm.Log{
		Id:          int64(model.ID),
		ActionType:  model.ActionType,
		Status:      model.Status,
		Level:       model.Level,
		HandleTime:  model.HandleTime,
		ExternalId:  model.ExternalID,
		CreatedTime: model.CreatedTime,
		CreatedBy:   model.CreatedBy,
		Result:      log_gorm.Result(model.Result),
	}
}
