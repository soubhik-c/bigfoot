#!/bin/bash

pyver=`python3 --version | egrep '3.1[0-9]'` 
if [[ "`uname`" =~ 'Darwin' && -z $pyver ]]; then
   echo "Need python 3.10 or higher, trying 'brew install python@3.10', ctrl-c to break in next 10secs"
   sleep 20s
   brew install python@3.10
   echo 'export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"' >> ~/.zshrc
   exit 1
elif [[ -z $pyver ]]; then
  echo "Need python 3.10 or higher"
  exit 1
fi


shtype=${SHELL##/*/}
echo "extracted shell type $shtype from $SHELL"

[[ ! -f `which conda` ]] && echo "anaconda not found" && exit 1

cd "$( dirname $0 )"

envname=condaenv6
cwd=`pwd`

echo "$cwd"

check_errors() {
  if [[ "$?" != 0 ]]; then
    exit 1
  fi
}

configure_conda() {
  conda config --add channels conda-forge
  conda config --set channel_priority strict 
  conda config --set show_channel_urls True
}

[[ -d "$envname" ]] && rm -r $envname
if [[ ! -d ${cwd}/${envname} ]]; then
  conda create --prefix ${cwd}/${envname} python=3 -y -q  # --file=environment.txt
  output="`conda init $shtype 2>&1 | grep $shtype`"

  # srcpath="${output##*( )}"
  IFS=' ' read -r -a srcpath <<< "$output"
  echo "---- ${srcpath[@]}"
  shsrc="${srcpath[@]: -1}"
  echo "extracted [$shsrc] from [ $output ] "

  source $shsrc
  configure_conda
fi

rechkenv="`conda info --envs | grep ${envname}`" 
[[ ! -n $rechkenv ]] && echo "conda env not found!!" && exit 1 || echo "env ${rechkenv} found !!"

conda activate ${cwd}/${envname}
configure_conda

conda install "geopandas>=0.10.2" -y
check_errors

echo "installed geopandas... installing wordcloud"
conda install -c conda-forge wordcloud contextily nltk spacy -y
check_errors

python -m spacy download en_core_web_lg
python -m spacy download en_core_web_sm
check_errors

conda install jupyter -y
echo "installed jupyter ... "
check_errors

conda list --explicit > environment.txt
jupyter-notebook src/ma705.ipynb

