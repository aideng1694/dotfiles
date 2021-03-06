#!/usr/bin/env bash

function create-project-help () {
  echo -e "create-project, A tool that allows you to simply create projects";
  echo -e "Usage: create-project [options]... [name]";
  echo -e "";
  echo -e "Options:";
  echo -e "  -h, --help            print this help";
  echo -e "  --no-git              do not initialize a git repo in the new project";
  echo -e "  --no-init-files       do not add init files from https://github.com/aideng1694/ProjectSetup";
  echo -e "";
  echo -e "Email bug reports, questions, discussions to <aideng1694@yahoo.com> and/or open issues at";
  echo -e "this project's GitHub page https://github.com/aideng1694/dotfiles";

  return 0;
}

function create-project () {
  # Parameter related
  did_help=0;
  git_repo=1;
  init_files=1;

  # Global Variable Related
  if [ -z "$PROJECT_DIR" ]; then
    # $PROJECT_DIR doesn't exist

    # This is the same as "~/Projects"
    PROJECT_DIR="$HOME/Projects";
  fi

  # Other Variables
  PROJECT_NAME="";

  # Param Checking
  for param in "$@"; do
    # Is the param we're checking start with "-" (Is an option)?
    if [[ $param == -* ]]; then
      if [[ did_help -eq 0 ]]; then
        case "$param" in
          '--help')
            create-project-help
            did_help=1
            ;;
          '-h')
            create-project-help
            did_help=1
            ;;
          '-?')
            create-project-help
            did_help=1
            ;;
          '--no-git')
            git_repo=0
            ;;
          '--no-init-files')
            init_files=0
            ;;
        esac
      else
        case $param in
          '--no-git')
            echo "Do not create a git repo"
            ;;
          '--git')
            echo "Create a git repo"
            ;;
          '--init_files')
            echo "Get init files ftom https://github.com/aideng1694/ProjectSetup"
            ;;
          '--no-init_files')
            echo "Don't get init files ftom https://github.com/aideng1694/ProjectSetup"
            ;;
        esac
      fi
    # The parameter we're checking doesn't start with "-" (Isn't an option)
    else
      PROJECT_NAME=$param
    fi

    # Delete local variables
    unset param;
  done

  # Make sure PROJECT_NAME is defined
  if [[ ! -z "$PROJECT_NAME" ]]; then
    # Make sure the project doesn't exist
    if [[ ! -d "$PROJECT_DIR/$PROJECT_NAME" ]]; then
      # Create the project
      mkcd "$PROJECT_DIR/$PROJECT_NAME";

      # Are we allowed to make a git repo
      if [[ $git_repo -eq 1 && -x "$(which git)" ]]; then
        # We are allowed to make a git repo
        if [[ -x "$(which git)" ]]; then
          # git is in path
          git init |> /dev/null
          echo -e "${COLOUR_GREEN}Created ${COLOUR_BLUE}git${COLOUR_GREEN} repo in $PROJECT_DIR/$PROJECT_NAME";
        else
          # git is not in path
          echo -e "${COLOUR_CYAN}Git is not installed.${COLOUR_RESET}";
        fi
      fi

      # Are we allowed to add the init files?
      if [[ $init_files -eq 1 ]]; then
        # Get the zip file from GitHub
        wget 'https://github.com/aideng1694/ProjectSetup/archive/master.zip' -O project-setup.tmp.zip -o /dev/null;

        # Extract the zip file
        unzip project-setup.tmp.zip -d $(pwd);

        # Remove the zip file
        rm project-setup.tmp.zip -f;

        # Commit files to git if we made a git repo
        if [[ $git_repo -eq 1 ]]; then
          git add . |> /dev/null
          git commit -m ':tada: Initial Commit';
        fi
      fi

      echo -e "${COLOUR_GREEN}Success! Project created at ${COLOUR_YELLOW}${PROJECT_DIR}/${PROJECT_NAME}${COLOUR_RESET}";
    # The project exists
    else
      echo -e "${COLOUR_RED}Project already exists. Returning...${COLOUR_RESET}";
      return 1;
    fi
  else
    echo -e "${COLOUR_RED}Something broke in the function. Sorry.${COLOUR_RESET}";
    return 1;
  fi

  # Get rid of internal variables
  unset did_help;
  unset git_repo;
  unset init_files;

  # Go back to where we where before
  cd $OLDPWD
}