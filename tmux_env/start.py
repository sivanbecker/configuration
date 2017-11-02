#!/usr/bin/env python3

import os

import click
import logbook
import yaml
from conf import tdict

_logger = logbook.Logger(__name__)


################# GENERAL FUNCS #############

def _get_env_command(dir):
    if os.path.exists(os.path.realpath(dir)+'/../.env3'):
        return 'cd {} && source ../.env3/bin/activate'.format(dir)
    elif os.path.exists(os.path.realpath(dir)+'/../.env2'):
        return 'cd {} && source ../.env2/bin/activate'.format(dir)
    elif os.path.exists(os.path.realpath(dir)+'/.env3'):
        return 'cd {} && source .env3/bin/activate'.format(dir)
    elif os.path.exists(os.path.realpath(dir)+'/.env2'):
        return 'cd {} && source .env2/bin/activate'.format(dir)


def _get_pane_command(cmds):
    return '&&'.join(list(filter(None, cmds)))

def _windows(names=[], pane_cmds=[], work_dir=None, layout='even-horizontal', tool=None, tdict=None):

    if tdict:
        if not tdict.get(tool):
            raise ValueError("No tool %s in configuration file %s" % (tool, os.path.dirname(__file__) + '/conf.py'))
        names = tdict[tool]['names']
        pane_cmds = tdict[tool]['pane_cmds']
        work_dir = tdict[tool]['work_dir']

    w = dict()
    w['windows'] = []
    w['tool'] = tool
    for index,name in enumerate(names):
        try: 
            w['windows'].append({'window_name': name,
                                 'layout':layout,
                                 'panes':[_get_pane_command([_get_env_command(work_dir),pane_cmds[index]])]})
        except IndexError:
            # for cases where no pane command, just create a pane
            w['windows'].append({'window_name': name,
                                 'layout':layout,
                                 'panes':[_get_pane_command([_get_env_command(work_dir)])]})

    w['work_dir'] = os.path.dirname(work_dir)
    w['env'] = w['work_dir']+'.env'

    return w

###################### END GENEREAL FUNCS #################

@click.command()
@click.argument('tool')
def develop(tool):
    tmuxp = os.path.dirname(os.path.realpath(__file__)) + '/.tmuxp'
    if os.path.exists(os.environ.get('HOME')+"/.tmuxp/%s.yaml" % tool):
        tmux_config_filename = os.environ.get('HOME')+"/.tmuxp/%s.yaml" % tool
    else:
        try:
            w = _windows(tool=tool, tdict=tdict)
        except ValueError as e:
            click.secho(e.__str__(), fg='red')
            exit(1)

        stpath = w['work_dir'] + '/{}_tmuxconf.yml'.format(tool)
        tmux_config_filename = os.path.abspath(stpath)
        with open(tmux_config_filename, 'w') as f:
            yaml.dump(_get_tmux_config(w), f)
        os.chdir(tdict[tool]['work_dir'])
    
    os.execve('/home/archhome/Scripts/.env3/bin/tmuxp',
              [tmuxp, 'load', tmux_config_filename],
              {**os.environ})


def _get_tmux_config(tool_windows):
    return {
        'session_name': tool_windows['tool'],
        'windows': tool_windows['windows'],
    }

if __name__=='__main__':
    develop()
