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
    ticksSinceMatch = 0
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
        matchedIndexes = []
        for index,cleanedParticle in enumerate(cleanedParticles):
            for index2,cleanedParticle2 in enumerate(cleanedParticles):
                p1 = cleanedParticle['p']
                p2 = cleanedParticle2['p']
                #print(cleanedParticle,cleanedParticle2)
                if index != index2 and p1[0] == p2[0] and p1[1] == p2[1] and p1[2] == p2[2]:
                    if matchedIndexes.count(index) == 0:
                        matchedIndexes.append(index)
                    if matchedIndexes.count(index2) == 0:
                        matchedIndexes.append(index2)
        x = 0
        for matchedIndex in matchedIndexes:
            cleanedParticles.pop(matchedIndex-x)
            x += 1
            ticksSinceMatch = 0
        ticksSinceMatch += 1
        if ticksSinceMatch > 1200:
            break

    return len(cleanedParticles)

testOneResult = solve(open("2017/20test2.txt", "r").read())
print(testOneResult, testOneResult == 1)
print(solve(open("2017/20.txt", "r").read()))

