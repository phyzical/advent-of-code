defmodule DayTwoPartTwo do
  @moduledoc false

  def solve(input) do
    input = input |> Helper.splitStringByNewLine
    IO.puts input |> findClosestMatch(Enum.to_list 1..10)
  end

  def findClosestMatch(list,differingChars = [first|rest]) when Kernel.length(differingChars) > 0 and is_list(differingChars) do
    result = list |> findClosestMatch(first)
    if result && result != "no match" do
      "IDs differed by " <> (first |> Integer.to_string) <> " and the answer is " <> result
    else
      list |> findClosestMatch(rest)
    end
  end

  def findClosestMatch(_,differingChars) when is_list(differingChars) do
    "no match"
  end

  def findClosestMatch(list = [first|rest],differingChars) when Kernel.length(list) > 0 do
    result = first |> checkList(rest,differingChars)
    if result do
      first |>
      String.graphemes |>
      Enum.with_index |>
      Enum.reduce("",fn {v,k},acc ->
        if is_nil(result |> Enum.at(k)) do
          acc <> v
        else
          acc
        end
      end)
    else
      rest |> findClosestMatch(differingChars)
    end
  end

  def findClosestMatch(_,_) do
    "no match"
  end

  def checkList(word1,list = [first|rest],differingChars) when is_list(list) and Kernel.length(list) > 0 do
    result = word1 |> returnDiffingLetters(first,[],0)
    if result && result |> Helper.countNonNil(0) == differingChars do
      result
    else
      word1 |> checkList(rest,differingChars)
    end
  end

  def checkList(_,list,_) when is_list(list) do
    false
  end

  def returnDiffingLetters(word1,word2,lettersToReplace, count) when count < byte_size(word1) do
    char = word1 |> String.at(count)

    lettersToReplace =
    if word2 |> String.at(count) == char do
      lettersToReplace ++ [nil]
    else
      lettersToReplace ++ [char]
    end

    word1  |>
      returnDiffingLetters(word2, lettersToReplace, count+1)
  end

  def returnDiffingLetters(_,_,lettersToReplace,_) do
    lettersToReplace
  end
end

DayTwoPartTwo.solve("wlpiogsvdfecjdqmnxakudrhbz
wbpioesvyfecjuqmlxaktdrhbz
blviogavyfecjuqmnxaktdrhbz
wlpiogsvydecjuqmnipktdrhbz
wlwiogsvyfmcjuqmoxaktdrhbz
wlpiogsvphecjuqmnxaktdrzbz
wlpiogsvyfecjuqmnkakhdrkbz
wlpiogsvyfhcjuqmnxxktddhbz
wlpiogsvyfccfuqmnxgktdrhbz
wlpiogsvhmecjvqmnxaktdrhbz
wlpiogsvyfecjdqqnxaktdrhyz
wlpiogyvycecjaqmnxaktdrhbz
wlpiogsvyfecjfqmnxaktybhbz
wkpiogsvyfmcauqmnxaktdrhbz
wlmiolsvyfecjuqmnxaktdrhbn
wlpioksvyfecjuqmnxaktdrhgs
wlpiogsvyflcjuvmnxsktdrhbz
wgziogsvyfecjuqmnxaktdrhoz
whpingsvyeecjuqmnxaktdrhbz
wlpiogsvyfecjuqgnxaktdvhlz
wlpioasvtfecjuqmnxaktdahbz
wlpihgsvefeceuqmnxaktdrhbz
wlpiogsvyfecyuqwnxaktdghbz
wlpfsgsvyfhcjuqmnxaktdrhbz
wlpiogyvyfecjuqmnxalpdrhbz
wlpiogsvyfescsqmnxaktdrhbz
wluiogsvyfecytqmnxaktdrhbz
wltiorsvyfecjuqmoxaktdrhbz
wlmiogwvyfejjuqmnxaktdrhbz
wlpiogsvyfycjuumnxvktdrhbz
wlkiogsqyfecjqqmnxaktdrhbz
wlpiogsvyfecouqmnxaktfrubz
hupiogsvlfecjuqmnxaktdrhbz
wlpiogsvpxecjuqmnxaksdrhbz
wlpiogsvyfkcjfqmnxxktdrhbz
wlpiogsjyfecjuqnnxakthrhbz
wlpiogsvyfecjuqmnxaktddhdk
wlpipgsvyfecjuqmnhaktdrubz
wlpiogsoyfenjpqmnxaktdrhbz
wlpiogsvyfecnuqmnxaxtdrmbz
wlpiggsvyfjcjuumnxaktdrhbz
wlppogsvyfecjuqmnxautdhhbz
wlpiovbvyfecjuqmnxaktcrhbz
wlpiogsvyfecjoqmnxaktdrobu
wlpiohsvyfecjugmnxakthrhbz
wvpiogovyfecjuqmnxakwdrhbz
wlpiogsbyfecjuqmnxdktdrtbz
wlpnogsvyfecjuqmnxakykrhbz
wlpiogpvyfecjuqmnxvktdrhbs
wlpiogsvkvecjuqmnxadtdrhbz
wlkihgsvyfecjuqmnxlktdrhbz
wlpilgsvyfhcjuqmnxakudrhbz
wlpioksvysgcjuqmnxaktdrhbz
wlpiogsvyfecorqmoxaktdrhbz
wlpiogsvyfectzlmnxaktdrhbz
wlpiogsvywecjuqwnqaktdrhbz
wlpiowsvyfecjuqrnxaftdrhbz
wlpiogsuyfecjutmnxaktnrhbz
wepiowsvyfqcjuqmnxaktdrhbz
wlpirgssyfecjuqmvxaktdrhbz
wlyiogstyfecjuqmnxaktdrhbw
wlpiogseyfecauqmnxaktdjhbz
wlpioisvyfenjuqmnxakrdrhbz
wlpiogsvyfrgjfqmnxaktdrhbz
wlpionsvyfecjmqmjxaktdrhbz
alpiggsvyfecjuqmnxaktdrhkz
wlphngsvyfecjuqmnxfktdrhbz
wlpiogsvyferjuqmlxakttrhbz
wlniogsvefecjuqsnxaktdrhbz
wlpiogsvyfncjurmnxakudrhbz
wlpiogsvyfecjuqmnxaktprlaz
wlpiocsvyfecjupmkxaktdrhbz
wlpihgsvyfecjeqfnxaktdrhbz
wlwioasvyfjcjuqmnxaktdrhbz
wlpifgsvyfecjuqsnxaktdshbz
wlxiogsvyrechuqmnxaktdrhbz
wlpiogovyfxcjuqmnxakkdrhbz
wlpiogsvyfecjkqmdxaktmrhbz
wlpiogsvyfecjwqmntaktdhhbz
wlpiogsvdfecjuqmmxaktbrhbz
wlpiogsvyfecauqmnxaksdrhwz
wlpiogsvwfecjuqznxaktorhbz
wlpiogtvyfecjuqhnxakidrhbz
wlpiogsvyyecjuqmnxaktdrhwt
wljiogsvyfecfuqbnxaktdrhbz
wlpiogsvybecjuqmnxagtdrjbz
wrpiogsvyfecjuqmnuaktdrhbd
wlpiogsvyfecjurmnxnltdrhbz
blpvogsvyaecjuqmnxaktdrhbz
bfpiogyvyfecjuqmnxaktdrhbz
wlpiogsvyfecjuqinxaknddhbz
wlpizgsvvfecjuqxnxaktdrhbz
glpiogsvyrecjuqmnxaktdrhbr
wlpiogskhfecjutmnxaktdrhbz
wlpiogsvyfecmuqmnxaktdribc
wlpioesvwfecjuqmnxakkdrhbz
wlpionsrafecjuqmnxaktdrhbz
wlsiogsvyfecjuqmnaaktdrhvz
bloiogsvyfecjuqmnxakjdrhbz
wlpiogsvyfecjuqenmastdrhbz
wlpiogyvyfecjuqmuxakldrhbz
plpiogovyfecjuvmnxaktdrhbz
wlpiogsvyfebjuqmnkakvdrhbz
wlziogsvyfhcjuqmngaktdrhbz
wlsiogsvyfecjuqmnxaktdrzjz
plbiogsvyfecfuqmnxaktdrhbz
wfpiogsvyfecjuqknxaktdrhiz
wlpiogjbyfecjuqmnxaktprhbz
wmpiogsvyrecjcqmnxaktdrhbz
wlpiogsyyfecjuqmqxaktdrbbz
wlpiogsvyfecjuqknxaetdehbz
wlpiogsvyfezjuqmnxakkdhhbz
wlpiogsvyfecjjqvnxaktdrhiz
wkpiogsvyfucjuqmnxaktdrhbd
lliiogsvyfecjuqmnxaktdrhoz
wlpiogsvyfecjuqmsxdktdshbz
wlprogtvyfecjuqmnxaktvrhbz
wlpizgssyffcjuqmnxaktdrhbz
wlpioasvyfvcjuqmnxakldrhbz
wlpoogsvyyecjuqmnxastdrhbz
wlpiognvyfecjuqmnsaktdrhbr
wlpiogsoyfecjuqmnxaktdrhho
wfpiogsvydecjuqmnxaotdrhbz
wlpiogsvqhecjuqmnxaktdrhhz
wkpiogsvyfeojuqmnxaktdrqbz
wlpiogsvyfeveuqmnxaktdshbz
wlpiogbvyfecjuqmexaktdrcbz
wlpxogsvyfehjsqmnxaktdrhbz
wlpcogsvyfecjuqmnjakttrhbz
wlpiogsvvkecjuqmnxaftdrhbz
wlpiogsvffecnuqmnxaktdnhbz
wlpiogsvyfecjupjnxaktdrhbr
wlpqogsvyfecjuqmnxlktdphbz
wlpxogsvyfecjvqmnxaktirhbz
elpiogsvyfecjuqlnxaqtdrhbz
wspiogsvrfecjuqmnxakadrhbz
wlpiogsmyfecbuqmnxactdrhbz
wlpiogsvyfecauqmnyakzdrhbz
wlsiogsvyfecjuqmnxakvdrnbz
wlpiogsxyfeijuqmnxakndrhbz
wlpiogsvyfecjuumnxakbyrhbz
wlpiogsvyfecjuqmnxhktdyhbo
wlpiogsvyfecjuqqnxnjtdrhbz
wapiogsvyfecjuqmnxoktdrmbz
wlpiogsvyfeejvqmnxaktdrubz
wlpitgsvyeectuqmnxaktdrhbz
alpiogsvyfecjulmnxaktdchbz
wlpiogsvyfecjuqmuxoktdrwbz
wlpiogsvyfzgjuhmnxaktdrhbz
wlpnogsvyfecjuqmdxaktyrhbz
wlpiogsvyfecjuqmnxakthrhra
wliiogsvyfecluqmnxaktdhhbz
wlpiogsvyfecjuymnxaltdrhwz
wlpiogsvyfeljuqmnxaktyrhbd
wlpiygsvvfecjuqmfxaktdrhbz
wlpiogihsfecjuqmnxaktdrhbz
wlpiogjvyfecjuqmnhuktdrhbz
wldiogsvyfecjiqmwxaktdrhbz
wlpiogsvjfecjuqmnxaktdrgbr
wlpioisvyfecjuqwnxabtdrhbz
wlviogsvyfscjuqmnxqktdrhbz
wlpiogsvyfecjuqmuxakbdrubz
wlpiogsvyfecjuqmnxmatdrhqz
wlpiogsvyfbcjuqwmxaktdrhbz
wlpiogsvyfexjuqmnxuxtdrhbz
wljiogsvbfecjuqmnxartdrhbz
wlpvogsvyfeujuqmnxaktdmhbz
wnpiogsvyfekjuqanxaktdrhbz
wlprogsvyfecjuqmzxvktdrhbz
wkpiogvvyfecjuqmnxaktdrabz
wlpiogsvwfecjuqmnxaktkbhbz
wlpiogsvyfecjlqmnxtttdrhbz
wlpioqsvyfecjuqznxaktyrhbz
wlpiogsvyfecjuqmnxnethrhbz
wlpiogsyyfgcjuqmnxaktdrhbm
wlpiopsvbfecjuqmnxaktdlhbz
wloqogsvyfucjuqmnxaktdrhbz
wlpiogsvmfecjuqmnxmktdrhtz
wlhiogsvyfecjuhmnxaktsrhbz
wlpioggvpfecjufmnxaktdrhbz
wlpiogsvyfbcjuomnxaktdrhbh
wlpmogsvyfecyuqmnxoktdrhbz
wlpiogslyfecjuqmnxaptyrhbz
tlpiogsnyfecguqmnxaktdrhbz
wlpiogsvyfecjuqmnxwktwehbz
wlpiogsvgfecjuqmnxaktdrabu
wbpiogsvyfecjuqmnxagtdrhoz
wlwipgsvyfecjuqmnxaktdrhbu
wlpwogsvykeczuqmnxaktdrhbz
wlpgogsvwfecjuqmnxcktdrhbz
wlpiogsqyfecjuqmrxaktdrrbz
wlpiogsvyfecjuqmnxakthrafz
wypicgseyfecjuqmnxaktdrhbz
wlpiogcvqfecjuqmnxaktdrhzz
wlriogsvyfecouqmnkaktdrhbz
wlpiogsvyfemjulmnxaktdrhdz
flpiogadyfecjuqmnxaktdrhbz
wupiogsvyfbvjuqmnxaktdrhbz
wlpiogsvyfebjummnxaktdrrbz
wjpiogsvyfecjuqmnxaktprybz
wlpirgsvyfecjiqmnxaatdrhbz
bvpiogsvyfecjuqmnxaktdrhez
wlpiogsvyfxcjuqmnxykzdrhbz
wlkiwgsqyfecjqqmnxaktdrhbz
wepaogsvyfecjxqmnxaktdrhbz
wlpiovsvyfecjjqmnxaktdmhbz
wlpioysryfecjuqmnxaktdrhiz
wlpizjsvyfecjuvmnxaktdrhbz
dlpiogsvyfecjucmnxakbdrhbz
wlpiogsccfecjrqmnxaktdrhbz
wlpioggvyfecpuqmnxagtdrhbz
wlpiogsvyfvcjuumlxaktdrhbz
wwpiogsryfjcjuqmnxaktdrhbz
wlpiogsvyfecjuqynxaktdrogz
wlpiogsvyfecjpqmnxskbdrhbz
wlpiogsvyfecjuhmfxaktvrhbz
wlpiogevyfecjrqmnwaktdrhbz
wlpiigsvyfemjuqmnxaktdrhtz
wlpcogsvyfecjuqhnxakgdrhbz
wupiogsvyfxcjuqmnxaktdrhgz
wlsiogsvyfecjuqenxuktdrhbz
wlpioglvyfecjujmexaktdrhbz
wlriogsvyfeljuqmnxattdrhbz
wlpiogsvyfecfuqmhxaktkrhbz
wlppogsvyfecjuqmxxabtdrhbz
wlniogsvyfevjuqwnxaktdrhbz
wlhiogsvyfecjuqmnxactxrhbz
ilpiogivyflcjuqmnxaktdrhbz
wlpmogsvyfecjuqmnxaktdrlbs
wipiogsvyfeqjuqmnxaktrrhbz
wvpiogsvyfecjuqknxaktdrrbz
wwpioguvyfecxuqmnxaktdrhbz
wlpiogsvkfdcjuqmnxaktdzhbz
wlpiogfvyfecjuqmnxadtdrhbg
wlpiogsvyzefjuqfnxaktdrhbz
wlpiogstyfechuqmnxaktdchbz
wlpiogszyfedjuqmnxsktdrhbz
wzpiozsvyfncjuqmnxaktdrhbz
xlpiogsvyfefjuqmnmaktdrhbz
wlpiogsvyfebxummnxaktdrhbz
wlpiogsgyfecfurmnxaktdrhbz
wlpqogsvyfecjuomnxaktdrhbi
wlpiogjvufecjuqmnxaktdrhbd
wlpiolsvyfecduqmnxaktrrhbz
wlpxogsvyfecjuqmnxaktgrhbk
wlpiogsfyfncjuqmnxsktdrhbz
wlpioggvyfecjufmnxaktdrebz
wlpiogsvyfecfujmnxaktdrwbz
rlpiogsvyfecjlqmnxaktdqhbz
wlpfogsvyfecjuimnxaktfrhbz")