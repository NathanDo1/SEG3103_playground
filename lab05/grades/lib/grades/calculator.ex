defmodule Grades.Calculator do

  defp avg(a, b) do #Question 2.1; Commit 1
    avg = a / b
  end

  defp failed_to_participate(a, b, c) do #Question 2.2; Commmit 2
    if a < 0.4 || b < 0.4 || c < 3 do
      true
    else
      false
    end
  end

  defp calculate_grade(a, b, c, d) do #Question 2.3; Commit 3
    final_grade = 0.2 * a + 0.3 * b + 0.2 * c + 0.3 * d
  end

  defp count_labs(%{labs: labs}) do #Question 2.4; Commit 4
    num_labs = #H
      labs
      |> Enum.reject(fn mark -> mark < 0.25 end)
      |> Enum.count()
  end

  def percentage_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework =
      if Enum.count(homework) == 0 do #A
        0 #B
      else
        avg(Enum.sum(homework), Enum.count(homework)) # changing to using defp avg(a,b); Commit 1
        #Enum.sum(homework) / Enum.count(homework) #C
      end

    avg_labs =
      if Enum.count(labs) == 0 do #D
        0 #E
      else
        avg(Enum.sum(labs), Enum.count(labs)) # changing to using defp avg(a,b); Commit 1
        #Enum.sum(labs) / Enum.count(labs) #F
      end

    #mark = 0.2 * avg_labs + 0.3 * avg_homework + 0.2 * midterm + 0.3 * final #G
    mark = calculate_grade(avg_labs, avg_homework, midterm, final) #Question 2.3; Commit 3
    round(mark * 100) #last
  end

  def letter_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework =
      if Enum.count(homework) == 0 do #A
        0 #B
      else
        avg(Enum.sum(homework), Enum.count(homework)) # changing to using defp avg(a,b); Commit 1
        #Enum.sum(homework) / Enum.count(homework) #C
      end

    avg_labs =
      if Enum.count(labs) == 0 do #D
        0 #E
      else
        avg(Enum.sum(labs), Enum.count(labs)) # changing to using defp avg(a,b); Commit 1
        #Enum.sum(labs) / Enum.count(labs) #F
      end

    avg_exams = (midterm + final) / 2 #G

    #num_labs = #H
    #  labs
    #  |> Enum.reject(fn mark -> mark < 0.25 end)
    #  |> Enum.count()

    num_labs = count_labs(labs) #Commit 4

    #if avg_homework < 0.4 || avg_exams < 0.4 || num_labs < 3 do #I
    if failed_to_participate(avg_homework, avg_exams, num_labs) do #Question 2.2; Commit 2
      "EIN" #J
    else
      #mark = 0.2 * avg_labs + 0.3 * avg_homework + 0.2 * midterm + 0.3 * final #K
      mark = calculate_grade(avg_labs, avg_homework, midterm, final) #Question 2.3; Commit 3

      cond do #L
        mark > 0.895 -> "A+"
        mark > 0.845 -> "A"
        mark > 0.795 -> "A-"
        mark > 0.745 -> "B+"
        mark > 0.695 -> "B"
        mark > 0.645 -> "C+"
        mark > 0.595 -> "C"
        mark > 0.545 -> "D+"
        mark > 0.495 -> "D"
        mark > 0.395 -> "E"
        :else -> "F"
      end
    end
  end

  def numeric_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework =
      if Enum.count(homework) == 0 do #A
        0 #B
      else
        avg(Enum.sum(homework), Enum.count(homework)) # changing to using defp avg(a,b); Commit 1
        #Enum.sum(homework) / Enum.count(homework) #C
      end

    avg_labs =
      if Enum.count(labs) == 0 do #D
        0 #E
      else
        avg(Enum.sum(labs), Enum.count(labs)) # changing to using defp avg(a,b); Commit 1
        #Enum.sum(labs) / Enum.count(labs) #F
      end

    avg_exams = (midterm + final) / 2 #G

    num_labs = #H
      labs
      |> Enum.reject(fn mark -> mark < 0.25 end)
      |> Enum.count()

    #if avg_homework < 0.4 || avg_exams < 0.4 || num_labs < 3 do #I
    if failed_to_participate(avg_homework, avg_exams, num_labs) do #Question 2.2; Commit 2
      0 #J
    else
      #mark = 0.2 * avg_labs + 0.3 * avg_homework + 0.2 * midterm + 0.3 * final #K
      mark = calculate_grade(avg_labs, avg_homework, midterm, final) #Question 2.3; Commit 3

      cond do #L
        mark > 0.895 -> 10
        mark > 0.845 -> 9
        mark > 0.795 -> 8
        mark > 0.745 -> 7
        mark > 0.695 -> 6
        mark > 0.645 -> 5
        mark > 0.595 -> 4
        mark > 0.545 -> 3
        mark > 0.495 -> 2
        mark > 0.395 -> 1
        :else -> 0
      end
    end
  end
end
