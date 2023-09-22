if [ $2 == True ]; then
  mkdir /content/drive/MyDrive/$3
  mkdir /content/drive/MyDrive/$3/output
  mkdir /content/drive/MyDrive/$3/checkpoint
  mkdir /content/drive/MyDrive/$3/lora
  mkdir /content/drive/MyDrive/$3/lycoris
  mkdir /content/drive/MyDrive/$3/embedding
  mkdir /content/drive/MyDrive/$3/hypernetwork
  mkdir /content/drive/MyDrive/$3/wildcards
  if [ "$4" ]; then
    mkdir /content/drive/MyDrive/$3/$4
    wget https://raw.githubusercontent.com/Arykrishna/webui/master/misc/example/install.sh -nc -O /content/drive/MyDrive/$3/$4/install.sh
  fi
  mkdir /content/$1/models/Lora
  mkdir /content/$1/models/LyCORIS
  mkdir /content/$1/models/hypernetworks
  mkdir /content/$1/models/insightface
  #wget https://github.com/facefusion/facefusion-assets/releases/download/models/inswapper_128.onnx -O /content/$1/models/insightface
  wget --quiet https://huggingface.co/henryruhs/roop/resolve/main/inswapper_128.onnx -P /content/$1/models/insightface
  
  # MENGHAPUS
  rm /content/$1/embeddings
  rm /content/$1/models/Stable-diffusion
  rm /content/$1/models/Lora
  rm /content/$1/models/LyCORIS
  rm /content/$1/models/hypernetworks
  rm /content/$1/outputs
  
  # MEMINDAHKAN OUTPUT DARI DRIVE KE COLAB
  mv /content/$1/outputs /content/$1/outputs_backup
  rm /content/$1/extensions/sd-dynamic-prompts/wildcards

  # MEMINDAHKAN FILE WLIDCARD DARI DRIVE KE COLAB
  mv /content/$1/extensions/sd-dynamic-prompts/wildcards /content/$1/extensions/sd-dynamic-prompts/wildcards_backup

  # MEMBUAT SHORTCUT KE COLAB
  ln -s /content/drive/MyDrive/$3/embedding /content/$1/embeddings
  ln -s /content/drive/MyDrive/$3/checkpoint /content/$1/models/Stable-diffusion
  ln -s /content/drive/MyDrive/$3/lora /content/$1/models/Lora
  ln -s /content/drive/MyDrive/$3/lycoris /content/$1/models/LyCORIS
  ln -s /content/drive/MyDrive/$3/hypernetwork /content/$1/models/hypernetworks
  ln -s /content/drive/MyDrive/$3/output /content/$1/outputs
  ln -s /content/drive/MyDrive/$3/wildcards /content/$1/extensions/sd-dynamic-prompts/wildcards

  # CONFIG.JSON
  rm /content/$1/config.json
  ln -s /content/drive/MyDrive/$3/json/config.json /content/$1

  # UI-CONFIG.JSON
  rm /content/$1/ui-config.json
  ln -s /content/drive/MyDrive/$3/json/ui-config.json /content/$1

  # STYLE.CSV
  rm /content/$1/styles.csv
  ln -s /content/drive/MyDrive/$3/json/styles.csv /content/$1

  #POSE FOR CONTROLNET BATCH
  ln -s /content/drive/MyDrive/$3/pose /content/$1

  #[EXTENSION] ALL IN ONE PROMPT
  ln -s /content/drive/MyDrive/$3/extensions_prompt_all_in_one/custom.yaml /content/$1/extensions/prompt-allinone/group_tags/

fi
