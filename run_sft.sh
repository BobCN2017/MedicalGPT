deepspeed --master_port 29500 -i localhost:0 \
supervised_finetuning.py \
    --model_type chatglm \
    --model_name_or_path THUDM/chatglm2-6b \
    --train_file_dir ./data/finetune/data \
    --validation_file_dir ./data/finetune/valid \
    --template_name chatglm \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --do_train \
    --do_eval \
    --use_peft True \
    --fp16 \
    --max_eval_samples 10 \
    --num_train_epochs 0.01 \
    --learning_rate 2e-5 \
    --warmup_ratio 0.05 \
    --weight_decay 0.05 \
    --logging_strategy steps \
    --logging_steps 10 \
    --eval_steps 1000 \
    --evaluation_strategy steps \
    --save_steps 1000 \
    --save_strategy steps \
    --save_total_limit 3 \
    --gradient_accumulation_steps 1 \
    --preprocessing_num_workers 1 \
    --model_max_length 534 \
    --output_dir outputs-sft-v1 \
    --overwrite_output_dir \
    --ddp_timeout 30000 \
    --logging_first_step True \
    --target_modules all \
    --lora_rank 8 \
    --lora_alpha 16 \
    --lora_dropout 0.05 \
    --torch_dtype float16 \
    --device_map auto \
    --report_to tensorboard \
    --ddp_find_unused_parameters False \
    --deepspeed deepspeed_config.json
