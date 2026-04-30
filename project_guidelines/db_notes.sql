CREATE TABLE `account_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `account_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `account_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_types_created_by_FK_idx` (`created_by`),
  KEY `account_types_modified_by_FK_idx` (`modified_by`),
  KEY `account_types_data_status_id_FK_idx` (`data_status_id`),
  CONSTRAINT `account_types_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `account_types_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `account_types_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `app_filters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `module_id` int NOT NULL,
  `filter` json DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_filters_created_by_FK_idx` (`created_by`),
  KEY `app_filters_modified_by_FK_idx` (`modified_by`),
  KEY `app_filters_data_status_id_FK_idx` (`data_status_id`),
  KEY `app_filters_module_id_FK_idx` (`module_id`),
  CONSTRAINT `app_filters_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `app_filters_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `app_filters_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `app_filters_module_id_FK` FOREIGN KEY (`module_id`) REFERENCES `app_modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `app_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `module_path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sort_order_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_modules_created_by_FK_idx` (`created_by`),
  KEY `app_modules_modified_by_FK_idx` (`modified_by`),
  KEY `app_modules_data_status_id_FK_idx` (`data_status_id`),
  KEY `app_modules_role_id_FK_idx` (`role_id`),
  CONSTRAINT `app_modules_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `app_modules_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `app_modules_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `app_modules_role_id_FK` FOREIGN KEY (`role_id`) REFERENCES `account_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `bank_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `account_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bank_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `branch_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ifsc_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `micr_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `upi_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_accounts_created_by_FK_idx` (`created_by`),
  KEY `bank_accounts_modified_by_FK_idx` (`modified_by`),
  KEY `bank_accounts_data_status_id_FK_idx` (`data_status_id`),
  CONSTRAINT `bank_accounts_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `bank_accounts_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `bank_accounts_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='  `` INT NULL,';

CREATE TABLE `bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `reference` tinytext,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmarks_created_by_FK_idx` (`created_by`),
  KEY `bookmarks_modified_by_FK_idx` (`modified_by`),
  KEY `bookmarks_data_status_id_FK_idx` (`data_status_id`),
  CONSTRAINT `bookmarks_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `bookmarks_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `bookmarks_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `communication_modes` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_created_by_FK_idx` (`created_by`),
  KEY `contacts_modified_by_FK_idx` (`modified_by`),
  KEY `contacts_data_status_id_FK_idx` (`data_status_id`),
  KEY `contacts_organization_id_FK_idx` (`organization_id`),
  CONSTRAINT `contacts_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `contacts_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `contacts_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `contacts_organization_id_FK` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `custom_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(128) DEFAULT NULL,
  `website_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `data_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `database_tables` (
  `id` bigint NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `table_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_database_tables_type_id_idx` (`table_type_id`),
  CONSTRAINT `fk_database_tables_type_id` FOREIGN KEY (`table_type_id`) REFERENCES `table_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `excel_meta_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `excel_file_name` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `excel_sheet_name` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `sql_table_name` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin NOT NULL,
  `excel_coluimn_name` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin NOT NULL,
  `sql_column_name` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `sql_column_type` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `excel_parent_sheet` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `sql_parent_table` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `excel_mapped_column` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `sql_mapped_column` varchar(64) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf32 COLLATE utf32_bin NOT NULL DEFAULT 'Entered',
  `sub_status` varchar(45) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `data_imported_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

CREATE TABLE `financial_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bank_account_id` int NOT NULL,
  `transaction_mode_id` int NOT NULL,
  `transaction_direction_id` int NOT NULL,
  `transaction_date` timestamp NULL DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `account_balance` decimal(10,2) NOT NULL,
  `transaction_notes` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `external_reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `financial_transactions_bank_account_id_FK_idx` (`bank_account_id`),
  KEY `financial_transactions_transaction_mode_id_FK_idx` (`transaction_mode_id`),
  KEY `financial_transactions_transaction_direction_id_FK_idx` (`transaction_direction_id`),
  KEY `financial_transactions_created_by_FK_idx` (`created_by`),
  KEY `financial_transactions_modified_by_FK_idx` (`modified_by`),
  KEY `financial_transactions_data_status_id_FK_idx` (`data_status_id`),
  CONSTRAINT `financial_transactions_bank_account_id_FK` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`),
  CONSTRAINT `financial_transactions_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `financial_transactions_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `financial_transactions_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `financial_transactions_transaction_direction_id_FK` FOREIGN KEY (`transaction_direction_id`) REFERENCES `transaction_directions` (`id`),
  CONSTRAINT `financial_transactions_transaction_mode_id_FK` FOREIGN KEY (`transaction_mode_id`) REFERENCES `transaction_modes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `industry_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `industry_types_created_by_FK_idx` (`created_by`),
  KEY `industry_types_modified_by_FK_idx` (`modified_by`),
  KEY `industry_types_data_status_id_FK_idx` (`data_status_id`),
  CONSTRAINT `industry_types_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `industry_types_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `industry_types_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `invoice_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `invoice_task_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `hours` decimal(5,2) DEFAULT NULL,
  `cost_per_unit` decimal(5,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_task_groups_invoice_id_FK_idx` (`invoice_id`),
  KEY `invoice_task_groups_created_by_FK_idx` (`created_by`),
  KEY `invoice_task_groups_modified_by_FK_idx` (`modified_by`),
  KEY `invoice_task_groups_data_status_id_FK_idx` (`data_status_id`),
  CONSTRAINT `invoice_task_groups_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `invoice_task_groups_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `invoice_task_groups_invoice_id_FK` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `invoice_task_groups_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `invoice_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `project_id` int NOT NULL DEFAULT '5',
  `from_organization_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `from_organization_pan` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `from_organization_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `from_organization_tax_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `to_organization_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `to_organization_pan` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `to_organization_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `to_organization_tax_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `grand_total_amount` decimal(10,2) DEFAULT NULL,
  `tds_amount` decimal(10,2) DEFAULT NULL,
  `net_payable_amount` decimal(10,2) DEFAULT NULL,
  `invoice_creater_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `invoice_creater_designation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `invoice_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number_UNIQUE` (`invoice_number`),
  KEY `invoices_created_by_FK_idx` (`created_by`),
  KEY `invoices_modified_by_FK_idx` (`modified_by`),
  KEY `invoices_data_status_id_FK_idx` (`invoice_status_id`),
  KEY `invoices_project_id_FK_idx` (`project_id`),
  CONSTRAINT `invoices_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `invoices_data_status_id_FK` FOREIGN KEY (`invoice_status_id`) REFERENCES `invoice_statuses` (`id`),
  CONSTRAINT `invoices_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `invoices_project_id_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `pan` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tax_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `account_type_id` int DEFAULT NULL,
  `industry_type_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organizations_created_by_FK_idx` (`created_by`),
  KEY `organizations_modified_by_FK_idx` (`modified_by`),
  KEY `organizations_data_status_id_FK_idx` (`data_status_id`),
  KEY `organizations_account_type_id_FK_idx` (`account_type_id`),
  KEY `organizations_industry_type_id_FK_idx` (`industry_type_id`),
  CONSTRAINT `organizations_account_type_id_FK` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  CONSTRAINT `organizations_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `organizations_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `organizations_industry_type_id_FK` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_types` (`id`),
  CONSTRAINT `organizations_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `project_tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `assigned_by` int DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `task_priority_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `estimated_hours` decimal(10,2) DEFAULT NULL,
  `worked_hours` decimal(10,2) DEFAULT NULL,
  `billed_hours` decimal(10,2) DEFAULT NULL,
  `task_status_id` int DEFAULT NULL,
  `sub_status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `invoice_task_group_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_tasks_created_by_FK_idx` (`created_by`),
  KEY `project_tasks_modified_by_FK_idx` (`modified_by`),
  KEY `project_tasks_project_id_FK_idx` (`project_id`),
  KEY `project_tasks_task_priority_id_FK_idx` (`task_priority_id`),
  KEY `project_tasks_task_status_id_FK_idx` (`task_status_id`),
  KEY `project_tasks_data_status_id_FK_idx` (`data_status_id`),
  KEY `project_tasks_assigned_by_FK_idx` (`assigned_by`),
  KEY `project_tasks_assigned_to_FK_idx` (`assigned_to`),
  KEY `project_tasks_invoice_task_group_id_FK_idx` (`invoice_task_group_id`),
  CONSTRAINT `project_tasks_assigned_by_FK` FOREIGN KEY (`assigned_by`) REFERENCES `contacts` (`id`),
  CONSTRAINT `project_tasks_assigned_to_FK` FOREIGN KEY (`assigned_to`) REFERENCES `contacts` (`id`),
  CONSTRAINT `project_tasks_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `project_tasks_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `project_tasks_invoice_task_group_id_FK` FOREIGN KEY (`invoice_task_group_id`) REFERENCES `invoice_task_groups` (`id`),
  CONSTRAINT `project_tasks_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `project_tasks_project_id_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `project_tasks_task_priority_id_FK` FOREIGN KEY (`task_priority_id`) REFERENCES `task_priorities` (`id`),
  CONSTRAINT `project_tasks_task_status_id_FK` FOREIGN KEY (`task_status_id`) REFERENCES `task_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `cost_per_hour` decimal(10,2) DEFAULT NULL,
  `tds_percentage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_by` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `data_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_created_by_FK_idx` (`created_by`),
  KEY `projects_modified_by_FK_idx` (`modified_by`),
  KEY `projects_data_status_id_FK_idx` (`data_status_id`),
  KEY `projects_organization_id_FK_idx` (`organization_id`),
  KEY `projects_contact_id_FK_idx` (`contact_id`),
  CONSTRAINT `projects_contact_id_FK` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `projects_created_by_FK` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_data_status_id_FK` FOREIGN KEY (`data_status_id`) REFERENCES `data_statuses` (`id`),
  CONSTRAINT `projects_modified_by_FK` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_organization_id_FK` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `table_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `task_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `parent_id` int NOT NULL,
  `sort_order_index` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `task_priorities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `color_code` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `task_repeat_frequency_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `task_repeat_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `task_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `group_id` tinyint DEFAULT NULL,
  `color_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `status_id` int NOT NULL,
  `priority_id` int NOT NULL,
  `category_id` int NOT NULL,
  `due_date` date DEFAULT NULL,
  `reminder_at` datetime NOT NULL,
  `assigned_to` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `repeat_option_id` int NOT NULL DEFAULT '1',
  `repeat_frequency_type_id` int DEFAULT '1',
  `repeat_frequency` int DEFAULT '1',
  `group_id` bigint DEFAULT NULL,
  `list_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tasks_task_statuses_fk_key_idx` (`status_id`),
  KEY `tasks_task_priorities_fk_key_idx` (`priority_id`),
  KEY `tasks_task_categories_fk_key_idx` (`category_id`),
  KEY `tasks_task_custom_lists_fk_key_idx` (`list_id`),
  KEY `tasks_task_repeat_frequency_types_fk_key_idx` (`repeat_frequency_type_id`),
  KEY `tasks_task_repeat_options_fk_key_idx` (`repeat_option_id`),
  KEY `tasks_assigned_to_fk_key_idx` (`assigned_to`),
  KEY `tasks_created_by_fk_key_idx` (`created_by`),
  KEY `tasks_due_date_INDEX` (`due_date`) /*!80000 INVISIBLE */,
  KEY `tasks_reminder_at_INDEX` (`reminder_at`) /*!80000 INVISIBLE */,
  KEY `tasks_name_INDEX` (`name`),
  KEY `tasks_description_INDEX` (`description`),
  CONSTRAINT `tasks_assigned_to_fk_key` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_created_by_fk_key` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_task_categories_fk_key` FOREIGN KEY (`category_id`) REFERENCES `task_categories` (`id`),
  CONSTRAINT `tasks_task_custom_lists_fk_key` FOREIGN KEY (`list_id`) REFERENCES `custom_lists` (`id`),
  CONSTRAINT `tasks_task_priorities_fk_key` FOREIGN KEY (`priority_id`) REFERENCES `task_priorities` (`id`),
  CONSTRAINT `tasks_task_repeat_frequency_types_fk_key` FOREIGN KEY (`repeat_frequency_type_id`) REFERENCES `task_repeat_frequency_types` (`id`),
  CONSTRAINT `tasks_task_repeat_options_fk_key` FOREIGN KEY (`repeat_option_id`) REFERENCES `task_repeat_options` (`id`),
  CONSTRAINT `tasks_task_statuses_fk_key` FOREIGN KEY (`status_id`) REFERENCES `task_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `transaction_directions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `transaction_modes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_Logged_in` tinyint(1) NOT NULL DEFAULT '0',
  `account_status_id` int DEFAULT '2',
  `firstname` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lastname` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Username_UNIQUE` (`email`),
  KEY `UserStatusId_KEY_idx` (`account_status_id`),
  KEY `CustomerId_KEY_idx` (`customer_id`),
  CONSTRAINT `CustomerId_KEY` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `UserStatusId_KEY` FOREIGN KEY (`account_status_id`) REFERENCES `account_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

CREATE TABLE `users_x_account_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id_FK_idx` (`role_id`),
  CONSTRAINT `role_id_FK` FOREIGN KEY (`role_id`) REFERENCES `account_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
