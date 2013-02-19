maintainer       "RightScale, Inc."
maintainer_email "support@rightscale.com"
license          "Copyright RightScale, Inc. All rights reserved."
description      "RightScale Database Manager"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "13.3.0"


depends "rightscale"
depends "block_device"
depends "sys_firewall"
depends "db_mysql"
depends "db_postgres"
