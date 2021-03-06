maintainer       "Stratalux, Inc."
maintainer_email "razvan.tomescu@stratalux.com"
license          "Copyright Stratalux, Inc. All rights reserved."
description      "RightScale Database Manager"
long_description "RightScale Database Manager"
version          "1.0.0"


attribute "aws/user",
  :display_name => "AWS Username",
  :description => "The username of the AWS account (e.g., cred:AWS_USER).",
  :required => "required",
  :recipes => [ 
      "db::do_init_and_become_master" 
  ]
  
attribute "aws/password",
  :display_name => "AWS Password",
  :description => "The password of the AWS account (e.g., cred:AWS_PASSWORD).",
  :required => "required",
  :recipes => [ 
       "db::do_init_and_become_master" 
  ]

  attribute "db/dns/master/id",
  :display_name => "Database Master DNS Record ID",
  :description =>
    "The unique identifier that is associated with the DNS A record" +
    " of the master database server.The unique identifier is assigned by" +
    " the DNS provider when you create a dynamic DNS A record." +
    " This ID is used to update the associated A record with the private" +
    " IP address of the master server when this recipe is run." +
    " If you are using DNS Made Easy as your DNS provider, a 7-digit number" +
    " is used (e.g., 4403234).Example:4403234",
  :required => "required",
  :recipes => [
    "db::do_init_and_become_master"
  ]

attribute "db/replication/user",
  :display_name => "Database Replication Username",
  :description =>
    "The username of the database user that has 'replication' privileges." +
    " Example: cred:DBREPLICATION_USER.",
  :required => "required",
  :recipes => [
    "db::do_init_and_become_master"
  ]

attribute "db/replication/password",
  :display_name => "Database Replication Password",
  :description =>
    "The password of the database user that has 'replication' privileges." +
    " Example: cred:DBREPLICATION_PASSWORD.",
  :required => "required",
  :recipes => [
    "db::do_init_and_become_master"
  ]

  attribute "db/backup/lineage",
  :display_name => "Database Backup Lineage",
  :description =>
    "The prefix that will be used to name/locate the backup of a particular" +
    " database.Note: For servers running on Rackspace, this value" +
    " also indicates the Cloud Files container to use for storing" +
    " primary backups.If a Cloud Files container with this name" +
    " does not already exist,the setup process creates one." +
    " Example: text:prod_db_lineage",
  :required => "required",
  :recipes => [
     "db::do_init_and_become_master"
  ]


recipe "db::do_init_and_become_master",
  "Initializes the database and tags it as the master database server." +
  " Sets DNS. Starts a fresh backup from this master."