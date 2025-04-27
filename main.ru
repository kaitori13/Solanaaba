import requests
import telebot
import time

# Токен твоего бота
TOKEN = '8113463759:AAGDcv9ffQXXJvUjVVpDjHy88zUYZG*****'

# Твой Telegram user_id
MY_USER_ID = 450564953

# Инициализация бота
bot = telebot.TeleBot(TOKEN)

def get_solana_price():
    url = 'https://api.coingecko.com/api/v3/simple/price?ids=solana&vs_currencies=usd'
    response = requests.get(url)
    data = response.json()
    price = data['solana']['usd']
    return price

def send_daily_update():
    while True:
        price = get_solana_price()
        message = f"Сегодняшний курс Solana (SOL): ${price}"
        bot.send_message(MY_USER_ID, message)
        time.sleep(60)  # 60 секунд = 1 минута

if __name__ == "__main__":
    send_daily_update()
