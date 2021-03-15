

RunCommand() {

  if [[ -n "$VERBOSE_SCRIPT_LOGGING" ]]; then

      if [[ -n "$TTY" ]]; then
          echo "♦ $@" 1>$TTY
      else
          echo "♦ $*"
      fi
      echo "------------------------------------------------------------------------------" 1>$TTY
  fi

  if [[ -n "$TTY" ]]; then
        eval "$@" &>$TTY
  else
      "$@"
  fi

  return $?
}

EchoError() {

    if [[ -n "$TTY" ]]; then
        echo "$@" 1>&2>$TTY
    else
        echo "$@" 1>&2
    fi
    
}

RunCMDToTTY() {
    if [[ ! -e "$TTY" ]]; then
        EchoError "=========================================="
        EchoError "ERROR: Not Config tty to output."
        exit -1
    fi

    if [[ -n "$CMD" ]]; then
        RunCommand $CMD
    else
        EchoError "=========================================="
        EchoError "ERROR:Failed to run CMD. THE CMD must not null"
    fi
}

RunCMDToTTY
