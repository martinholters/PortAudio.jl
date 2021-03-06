using PortAudio

# config
buf_size = 256
sample_rate = 48000

# simply record a few samples
y = record(2*sample_rate, 2, sample_rate)

# use default device
devID = -1
# or retrieve a specific device by name
#devID = PortAudio.find_device("default")

# open stream and record a few seconds
stream = open(devID, (2, 0), sample_rate, buf_size)
z = read(stream, 2*sample_rate)
close(stream)
