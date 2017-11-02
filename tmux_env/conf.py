################# TEMPLATES ###############
tdict = {}
# tdict['infinilab'] = _windows(
#     names=[ 'trm1', 'trm2', 'trm3', 'shell', 'runserver', 'infinilab', 'dmns', 'db'],
#     pane_cmds=['', '', '', './manage.py shell','./manage.py runserver 5005','ssh infinilab', 'ssh infinilab-daemons','ssh infinilab-db'],
#     work_dir='/Users/sbecker/envs/infinilab/infinilab',
#     tool='infinilab')

# tdict['bro'] = _windows (
#     names=['bro', 'bro-db', 'local-bro'],
#     pane_cmds=['ssh bro', 'ssh bro-db', ''],
#     work_dir='/Users/sbecker/envs/bro/bro',
#     tool='bro'
#     )

# tdict['dhcpawn'] = _windows(
#     names=['trm1', 'trm2', 'trm3','testserver', 'pgcli', 'celery worker', 'rabbitmq-server'],
#     pane_cmds=['', '', '', 'cob testserver','pgcli dhcpawn', 'celery -A cob.celery.app.worker worker --loglevel=DEBUG -E -B','rabbitmq-server',],
#     work_dir='/Users/sbecker/envs/dhcpawn/dhcpawn/',
#     tool='dhcpawn')


# tdict['p2'] = _windows(names=['term3'], pane_cmds=['ls -l'], work_dir='/Users/sbecker/envs/p2/p2', tool='p2')

# tdict['p3'] = _windows(
#     names=['trm1', 'trm2', 'trm3'],
#     pane_cmds=['','',''],
#     work_dir='/Users/sbecker/envs/p3/p3',
#     tool='p3')

# tdict['infradev'] = _windows(names=['infradev_cli_1','infradev_cli_2','trm3'],
#                              pane_cmds=['cd infradev-cli/infradev_cli', 'cd infradev-cli/infradev_cli', ''],
#                              work_dir='/Users/sbecker/envs/itzik/infradev/',
#                              tool='infradev')

# tdict['flask'] = _windows(names=['trm1','trm2','trm3'],
#                           pane_cmds=['','',''],
#                           work_dir='/Users/sbecker/envs/flask/app1',
#                           tool='flask')

# tdict['meeseeks'] = _windows(names=['trm1','trm2','trm3'],
#                           pane_cmds=['','',''],
#                           work_dir='/Users/sbecker/envs/flask/meeseeks/meeseeks',
#                           tool='meeseeks')

tdict['dhcpawn'] = {
    'names': ['trm1','trm2','trm3','trm4','trm5','trm6','trm7'],
    'pane_cmds': ['export SQLALCHEMY_DATABASE_URI="postgresql+psycopg2://127.0.0.1/dhcpawn"','export SQLALCHEMY_DATABASE_URI="postgresql+psycopg2://127.0.0.1/dhcpawn"'],
    'work_dir': '/home/archhome/envs/dhcpawn/dhcpawn/',
    }

tdict['meeseeks'] = {
    'names': ['trm1','trm2','trm3'],
    'pane_cmds': [],
    'work_dir': '/home/archhome/envs/meeseeks/meeseeks/',
    }

tdict['scotty'] = {
    'names': ['trm1','trm2'],
    'pane_cmds': [],
    'work_dir': '/home/archhome/envs/scotty/scotty/',
    }

tdict['infinilab'] = {
    'names': ['trm1','trm2'],
    'pane_cmds': [],
    'work_dir': '/home/archhome/envs/infinilab/infinilab/',
    }

tdict['infradev_cli'] = {
    'names': ['trm1','trm2'],
    'pane_cmds': [],
    'work_dir': '/home/archhome/envs/infradev_cli/',
    }

tdict['mac'] = {
    'names': ['trm1','trm2','trm3'],
    'pane_cmds': [],
    'work_dir': '/home/archhome/envs/',
    }
#################### END TEMPLATES ##############
