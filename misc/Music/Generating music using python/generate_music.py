from pydub import AudioSegment
import wave
import struct
import numpy as np

# set the tempo of the music
tempo = 300
# set the notes and durations of the melody
melody = [('N', 4), ('A4', 7), ('B4', 1), ('C4', 3), ('B4', 3), ('B4', 1), ('C4', 1), ('B4', 1), ('C4', 1), ('B4', 1), ('A4', 4), ('B4', 1), ('A4', 1), ('B4', 1), ('A4', 1), ('G3', 4), ('A4', 2), ('N', 2)]

# set the duration of a beat in milliseconds
beat_duration = 60000 / tempo

# create a dictionary to map notes to frequencies
notes = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
note_freq = {}
n = 0

for j in range(0, 8):
    for i in notes:
        note_freq[f'{i}{j}'] = 2**(n/12)*27.5
        n+=1

note_freq['N'] = 0

# create a wave file with the given frequency and duration
def generate_wave(note, duration):
    sample_rate = 44100
    amplitude = 16000
    t = float(duration * beat_duration) / 1000
    f = note_freq[note]
    n_samples = int(t * sample_rate)
    data = [int(amplitude * np.sin(2 * np.pi * f * (x / sample_rate))) for x in range(n_samples)]
    return data

# generate the melody
song = []
for note, duration in melody:
    song.extend(generate_wave(note, duration))


# create a wave file
wave_file = wave.open('song.wav', 'w')
wave_file.setparams((1, 2, 44100, 0, 'NONE', 'compressed'))
for data in song:
    wave_file.writeframesraw(struct.pack('<h', data))
wave_file.close()

# convert the wave file to an audio file
# sound = AudioSegment.from_wav('song.wav')
# sound.export('song.mp3', format='mp3')