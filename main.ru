import requests
import telebot
import time

TOKEN = '8113463759:AAGDcv9ffQXXJvUjVVpDjHy88zUYZG*****'
MY_USER_ID = 450564953

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
        time.sleep(60)  # 1 минута паузы
        time.sleep(2)   # Плюс 2 секунды отдыха для Render (обязательно!)

if __name__ == "__main__":
    time.sleep(5)  # Пауза 5 секунд перед стартом, чтобы Render не ругался
    send_daily_update()
