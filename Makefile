create_cli:
	bash src/templates/create_cli_template.sh
installed_test:
	bash src/bootstrap/installed_test_boot.sh
uninstalled_test:
	bash src/bootstrap/uninstalled_test_boot.sh

create_installed_test:
	bash src/templates/create_installed_test_template.sh

# 创建单元测试文件
create_unit_test:
	bash src/templates/create_unit_test_template.sh

# 运行单元测试
unit_test:
	bash src/bootstrap/unit_test_boot.sh
	make -C src/zsh_toolbox unit_test
	
tmp:
	bash src/tmp.sh
	make -C src/zsh_toolbox tmp

