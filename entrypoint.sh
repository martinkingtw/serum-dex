if [[ $NETWORK == 'devnet' ]]
then
  until RUST_BACKTRACE=1
    /app/release/crank devnet consume-events --dex-program-id DESVgJVGajEgKGXhb6XmqDHGz3VjdgP7rEVESBgxmroY --payer /app/.config/solana/id.json --market $MARKET --coin-wallet 7JBPdjqRsCpp1faArgwtSmbXP2twmQqdJBz3AeuVWmyS --pc-wallet 8Lfu6bkNK77iC4mKd7gdGDt1SsPfY4FmktzjpViLiXbS --num-workers 1 --events-per-worker 5 --log-directory /app/log
  do
    echo "Server crashed with exit code $?. Respawning..." >&2
    sleep 1
  done
else
  until RUST_BACKTRACE=1
  /app/release/crank mainnet consume-events --dex-program-id 9xQeWvG816bUx9EPjHmaT23yvVM2ZWbrrpZb9PusVFin --payer /app/.config/solana/id.json --market $MARKET --coin-wallet 7JBPdjqRsCpp1faArgwtSmbXP2twmQqdJBz3AeuVWmyS --pc-wallet 8Lfu6bkNK77iC4mKd7gdGDt1SsPfY4FmktzjpViLiXbS --num-workers 1 --events-per-worker 5 --log-directory /app/log
  do
    echo "Server crashed with exit code $?. Respawning..." >&2
    sleep 1
  done
fi