import pandas as pd
import numpy as np
from urllib import request
from gensim.models import Word2Vec

DATASET_URL = "https://storage.googleapis.com/maps-premium/dataset/yes_complete/train.txt"
SONGS_URL = "https://storage.googleapis.com/maps-premium/dataset/yes_complete/song_hash.txt"

# Obtener el dataset de canciones
dataset = request.urlopen(DATASET_URL)

# Se omiten las primeras 2 líneas porque únicamente contienen metadatos
lines = dataset.read().decode("utf-8").split("\n")[2:]

# Se remueven las playlists con una sola canción
playlists = [l.rstrip().split() for l in lines if len(l.split()) > 1]

# Se carga la metadata de las canciones
songs_file = request.urlopen(SONGS_URL)
songs_file = songs_file.read().decode("utf-8").split("\n")
songs = [s.rstrip().split("\t") for s in songs_file]
songs_df = pd.DataFrame(data=songs, columns=["id", "title", "artist"])
songs_df.set_index("id")


# Entrenamiento del modelo Word2Vec
print("Entrenando el modelo Word2Vec...")
model = Word2Vec(
    playlists,
    vector_size=32,
    window=20,
    negative=50,
    min_count=1,
    workers=4
)

input_message = f'Selecciona una canción para obtener una recomendación. El listado de canciones disponibles va desde 0 hasta {len(songs_df) - 1}:\n'
song_id = int(input(input_message))

def get_recommendations(song_id):

    similar_songs = np.array(
        model.wv.most_similar(positive=str(song_id), topn=5)
    )[:, 0]

    return songs_df.iloc[similar_songs]

print("Canción seleccionada:\n", songs_df.iloc[song_id], "\n")
print("Canciones recomendadas:\n", get_recommendations(song_id))