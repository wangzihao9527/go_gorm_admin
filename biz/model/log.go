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

package model

import "time"

type Log struct {
	ID          int64     `thrift:"id,1" column:"id" gorm:"primarykey"`
	ActionType  string    `thrift:"action_type,2" column:"action_type" `
	Status      int64     `thrift:"status,3" column:"status" `
	Level       string    `thrift:"level,4" column:"level"`
	HandleTime  int64     `thrift:"handle_time,5" column:"handle_time" `
	CreatedTime time.Time `thrift:"created_time,6" column:"created_time" `
	CreatedBy   string    `thrift:"created_by,7" column:"created_by"`
	ExternalID  string    `thrift:"external_id,8" column:"external_id"`
	Result      int64     `thrift:"result,9" column:"result"`
}

func (u *Log) TableName() string {
	return "log"
}
