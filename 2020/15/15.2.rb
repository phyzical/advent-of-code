require_relative '15.1.rb'

iterations = 30000000

# ap DayFifthteenPartOne.solve(__dir__ + '/15test1.txt', iterations)  == 2578
# ap DayFifthteenPartOne.solve(__dir__ + '/15test2.txt', iterations) == 3544142
# ap DayFifthteenPartOne.solve(__dir__ + '/15test3.txt', iterations) == 261214
# ap DayFifthteenPartOne.solve(__dir__ + '/15test4.txt', iterations) == 6895259
# ap DayFifthteenPartOne.solve(__dir__ + '/15test5.txt', iterations) == 18
# ap DayFifthteenPartOne.solve(__dir__ + '/15test6.txt', iterations) == 362
# ap DayFifthteenPartOne.solve(__dir__ + '/15test7.txt', iterations) == 175594

ap DayFifthteenPartOne.solve(__dir__ + '/15.txt', iterations)
