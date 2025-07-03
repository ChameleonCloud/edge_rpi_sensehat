from sense_hat import SenseHat
from time import sleep

if __name__ == "__main__":

    sense = SenseHat()
    sense.clear()

    sense.show_message("CHI")
    sleep(5)
    while True:
        temperature = sense.get_temperature_from_humidity()
        temperature_string = "{:.1f}".format(temperature)

        print(f"Current temperature: {temperature_string}")
        sense.show_message(temperature_string, text_colour=[255, 0, 0])
        sleep(5)
