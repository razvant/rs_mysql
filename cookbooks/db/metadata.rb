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
