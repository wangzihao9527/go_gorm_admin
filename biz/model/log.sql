CREATE TABLE `log` (
                       `id` int(11) NOT NULL AUTO_INCREMENT,
                       `action_type` varchar(20) DEFAULT NULL COMMENT '服务信息',
                       `status` int(11) DEFAULT NULL,
                       `level` varchar(10) DEFAULT NULL,
                       `handle_time` int(11) DEFAULT NULL COMMENT '处理时间',
                       `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       `created_by` varchar(50) DEFAULT NULL,
                       `external_id` varchar(50) DEFAULT NULL,
                       `result` int(11) DEFAULT NULL COMMENT '结果。 0:成功。 1:失败',
                       PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;