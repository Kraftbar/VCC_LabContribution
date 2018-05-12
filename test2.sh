case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;; 
  linux*)   echo "LINUX" 
	echo write_the_LinuxCode here
	;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS"
	echo write_the_Windowscode here
   ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

