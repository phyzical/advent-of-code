def solve(input):
    particles = input.splitlines()
    cleanedParticles = []
    for particle in particles:
        particleSplits = particle.split(', ')
        cleanedParticles.append({
            'p': particleSplits[0].split('<')[1].replace('>','').split(','),
            'v': particleSplits[1].split('<')[1].replace('>','').split(','),
            'a': particleSplits[2].split('<')[1].replace('>','').split(',')
        })
    for index,cleanedParticle in enumerate(cleanedParticles):
        for cleanedParticleParts in cleanedParticle:
            for index2,cleanedParticlePart in enumerate(cleanedParticle[cleanedParticleParts]):
                cleanedParticles[index][cleanedParticleParts][index2] =  int(cleanedParticles[index][cleanedParticleParts][index2])
    ##doTick
    i = 0
    currentLowestKey = 999
    currentLowestKeyCount = 0
    while True:
        i += 1
        x = 0
        y = 1
        z = 2
        for cleanedParticle in cleanedParticles:
            #Increase the X velocity by the X acceleration.
            cleanedParticle['v'][x] += cleanedParticle['a'][x]
            #Increase the Y velocity by the Y acceleration.
            cleanedParticle['v'][y] += cleanedParticle['a'][y]
            #Increase the Z velocity by the Z acceleration.
            cleanedParticle['v'][z] += cleanedParticle['a'][z]
            #Increase the X position by the X velocity.
            cleanedParticle['p'][x] += cleanedParticle['v'][x]
            #Increase the Y position by the Y velocity.
            cleanedParticle['p'][y] += cleanedParticle['v'][y]
            #Increase the Z position by the Z velocity.
            cleanedParticle['p'][z] += cleanedParticle['v'][z]
        particleTotals = []
        for cleanedParticle in cleanedParticles:
            particleTotal = 0
            for cleanedParticleParts in cleanedParticle:
                for cleanedParticlePart in cleanedParticle[cleanedParticleParts]:
                    particleTotal += abs(cleanedParticlePart)
            particleTotals.append(particleTotal)
        lowestKey = 999
        lowestValue = 999999
        for index, particleTotal in enumerate(particleTotals):
            if particleTotal < lowestValue:
                lowestValue = particleTotal
                lowestKey = index
        if lowestKey == currentLowestKey:
            currentLowestKeyCount += 1
        else:
            currentLowestKey = lowestKey
            currentLowestKeyCount = 1
        if currentLowestKeyCount > 1200:
            break

    return currentLowestKey

testOneResult = solve(open("2017/20test.txt", "r").read())
print(testOneResult, testOneResult == 0)
print(solve(open("2017/20.txt", "r").read()))

