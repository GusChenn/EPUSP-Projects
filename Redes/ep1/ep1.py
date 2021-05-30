import numpy as np
import matplotlib.pyplot as plt

sampleRTT = np.loadtxt("dados.txt", delimiter = '/n', dtype = 'int')

#Declaração de parâmetros
media = 275
alpha = 1/8
beta = 1/4
estimatedRTT = np.ones(499)
devRTT = np.ones(499)
timeoutInterval = np.ones(499)

#Declaração das condições iniciais
estimatedRTT[0] = sampleRTT[0]
devRTT[0] = np.abs(sampleRTT[0] - media)
timeoutInterval[0] = estimatedRTT[0] + 4*devRTT[0]

#Calculo dos valores
for i in range (1, 499):
    estimatedRTT[i] = (1 - alpha)*estimatedRTT[i - 1] + alpha*sampleRTT[i]
    devRTT[i] = (1 - beta)*devRTT[i - 1] + beta*np.abs(sampleRTT[i] - estimatedRTT[i])
    timeoutInterval[i] = estimatedRTT[i] + 4*devRTT[i]
    
plt.figure(num=None, figsize=(16, 12), dpi=150, facecolor='w', edgecolor='k')
plt.plot(sampleRTT, label = "sampleRTT")
plt.plot(estimatedRTT, label = "estimatedRTT")
plt.plot(devRTT, label = "devRTT")
plt.plot(timeoutInterval, label = "timeoutInterval")
plt.legend()
plt.title("Resultados")
plt.show()


