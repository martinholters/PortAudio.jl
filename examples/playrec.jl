using PortAudio

# config
buf_size = 256
sample_rate = 48000

# use default device
devID = -1
# or retrieve a specific device by name
#devID = PortAudio.find_device("default")

# open a duplex stream (not supported on all host API...)
stream = open(devID, (2, 2), sample_rate, buf_size)

# play some noise and record it at the same time
x = convert(Array{Float32}, randn(MersenneTwister(),sample_rate*2,2))
x = x ./ 10
y = playrec(stream, x)

# close the stream
close(stream)
