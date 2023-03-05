# GENERATING MUSIC USING PYTHON
To generate music, we can use the Python package *pydub* and the *wave* module, which allows us to generate a wave file with a given frequency and duration.

In this code, we first set the tempo of the music and the duration of a beat in milliseconds. We then set the notes of the melody and create a dictionary to map notes to frequencies. We use the simple formula `f = 2**(n/12)*27.5` to assign frequencies to different notes, where `f` is the frequency, `n` is number of half-steps from the note *A0*, and 27.5 is the frquency of *A0* in *Hz*. Putting `n = 48` will give us the frequency of *A4* which is 48 half-steps away from *A0*, giving the value 440Hz. Music cannot be created without silence, so a blank note `N` is added to the dictionary of notes.

The `generate_wave` function creates a wave file with the given frequency and duration using the formula for a sine wave. We then use a loop to generate the melody by calling the `generate_wave` function for each note in the melody. The `melody` list contains the melody to be played. Notice that there are tuples in the list, the first value identifying the note and the second value identifying length of that note in beats in a given bar. 

Finally, we create a wave file using the wave module and convert it to an audio file using the pydub package. 

Two wave files are added containing the jingle of *Grameenphone* and *Banglalink*. The melody in the code gives the jingle of *Banglalink*.
