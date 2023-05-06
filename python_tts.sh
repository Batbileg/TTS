source .venv/bin/activate
python3 TTS/server/server.py --port 5002 --model_name tts_models/en/ljspeech/fast_pitch --vocoder_name vocoder_models/en/ljspeech/hifigan_v2
