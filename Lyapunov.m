(* Content-type: application/vnd.wolfram.mathematica *)

(*** Wolfram Notebook File ***)
(* http://www.wolfram.com/nb *)

(* CreatedBy='Mathematica 9.0' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       157,          7]
NotebookDataLength[    115070,       2224]
NotebookOptionsPosition[    114434,       2199]
NotebookOutlinePosition[    114777,       2214]
CellTagsIndexPosition[    114734,       2211]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[
 RowBox[{
  RowBox[{"(*", "\[IndentingNewLine]", "   ", 
   RowBox[{"*", " ", 
    RowBox[{"Author", ":", " ", 
     RowBox[{
     "Panichi", " ", "Federico", "\[IndentingNewLine]", "*", " ", "Unit", " ",
       "Name"}], ":", 
     RowBox[{"Lyapunov", "\n", "   ", "*", " ", "Unit", " ", 
      RowBox[{"Type", ":", " ", 
       RowBox[{
        RowBox[{"program", ".", "nb"}], "\n", "   ", "*", " ", "Project"}], 
       ":", " ", 
       RowBox[{"Master", " ", "Thesis", "\n", "   ", "*", " ", 
        RowBox[{"Package", ":", " ", 
         RowBox[{"none", "\n", "   ", "*", " ", "Language"}], ":", " ", 
         RowBox[{"Mathematica", " ", "9.0", "\n", "   ", "*", " ", 
          RowBox[{"Description", ":", " ", 
           RowBox[{
           "Calculate", " ", "the", " ", "Lyapunov", " ", "Characteristic", 
            " ", "Exponent", " ", "of", " ", "restricted", " ", "three", " ", 
            "body", " ", "problem", " ", "with", " ", "the", " ", "SHADOW", 
            " ", "PARTICLE", " ", "METHOD", "\n", "   ", "*", " ", 
            "Invocation"}], ":", " ", "none"}]}]}]}]}]}]}]}], 
   "\[IndentingNewLine]", "*)"}], "\[IndentingNewLine]", 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
    "Needs", "[", "\"\<DifferentialEquations`NDSolveProblems`\>\"", "]"}], 
    ";"}], "\n", 
   RowBox[{
    RowBox[{
    "Needs", "[", "\"\<DifferentialEquations`NDSolveUtilities`\>\"", "]"}], 
    ";"}], "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"\[Mu]", "=", "0.000954"}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     SuperscriptBox["\[Mu]", "*"], "=", 
     RowBox[{"1", "-", "\[Mu]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     SubscriptBox["r1", "1"], "=", 
     SqrtBox[
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "1"], "[", "t", "]"}], "+", "\[Mu]"}], ")"}], 
        "2"], "+", 
       SuperscriptBox[
        RowBox[{
         SubscriptBox["y1", "2"], "[", "t", "]"}], "2"]}]]}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     SubscriptBox["r1", "2"], "=", 
     SqrtBox[
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "1"], "[", "t", "]"}], "-", 
          SuperscriptBox["\[Mu]", "*"]}], ")"}], "2"], "+", 
       SuperscriptBox[
        RowBox[{
         SubscriptBox["y1", "2"], "[", "t", "]"}], "2"]}]]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq1", "=", 
     RowBox[{
      SubscriptBox["y1", "3"], "[", "t", "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq2", "=", 
     RowBox[{
      SubscriptBox["y1", "4"], "[", "t", "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq3", "=", 
     RowBox[{
      RowBox[{"2", " ", 
       RowBox[{
        SubscriptBox["y1", "4"], "[", "t", "]"}]}], "+", 
      RowBox[{
       SubscriptBox["y1", "1"], "[", "t", "]"}], "-", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[Mu]", "*"], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "1"], "[", "t", "]"}], "+", "\[Mu]"}], ")"}]}], 
       SubsuperscriptBox["r2", "1", "3"]], "-", 
      FractionBox[
       RowBox[{"\[Mu]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "1"], "[", "t", "]"}], "-", 
          SuperscriptBox["\[Mu]", "*"]}], ")"}]}], 
       SubsuperscriptBox["r1", "2", "3"]]}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq4", "=", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "2"}], " ", 
       RowBox[{
        SubscriptBox["y1", "3"], "[", "t", "]"}]}], "+", 
      RowBox[{
       SubscriptBox["y1", "2"], "[", "t", "]"}], "-", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[Mu]", "*"], " ", 
        RowBox[{
         SubscriptBox["y1", "2"], "[", "t", "]"}]}], 
       SubsuperscriptBox["r1", "1", "3"]], "-", 
      FractionBox[
       RowBox[{"\[Mu]", " ", 
        RowBox[{
         SubscriptBox["y1", "2"], "[", "t", "]"}]}], 
       SubsuperscriptBox["r1", "2", "3"]]}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     SubscriptBox["r2", "1"], "=", 
     SqrtBox[
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "1"], "[", "t", "]"}], "+", "\[Mu]"}], ")"}], 
        "2"], "+", 
       SuperscriptBox[
        RowBox[{
         SubscriptBox["y2", "2"], "[", "t", "]"}], "2"]}]]}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     SubscriptBox["r2", "2"], "=", 
     SqrtBox[
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "1"], "[", "t", "]"}], "-", 
          SuperscriptBox["\[Mu]", "*"]}], ")"}], "2"], "+", 
       SuperscriptBox[
        RowBox[{
         SubscriptBox["y2", "2"], "[", "t", "]"}], "2"]}]]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq5", "=", 
     RowBox[{
      SubscriptBox["y2", "3"], "[", "t", "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq6", "=", 
     RowBox[{
      SubscriptBox["y2", "4"], "[", "t", "]"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq7", "=", 
     RowBox[{
      RowBox[{"2", " ", 
       RowBox[{
        SubscriptBox["y2", "4"], "[", "t", "]"}]}], "+", 
      RowBox[{
       SubscriptBox["y2", "1"], "[", "t", "]"}], "-", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[Mu]", "*"], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "1"], "[", "t", "]"}], "+", "\[Mu]"}], ")"}]}], 
       SubsuperscriptBox["r2", "1", "3"]], "-", 
      FractionBox[
       RowBox[{"\[Mu]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "1"], "[", "t", "]"}], "-", 
          SuperscriptBox["\[Mu]", "*"]}], ")"}]}], 
       SubsuperscriptBox["r2", "2", "3"]]}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"deq8", "=", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "2"}], " ", 
       RowBox[{
        SubscriptBox["y2", "3"], "[", "t", "]"}]}], "+", 
      RowBox[{
       SubscriptBox["y2", "2"], "[", "t", "]"}], "-", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[Mu]", "*"], " ", 
        RowBox[{
         SubscriptBox["y2", "2"], "[", "t", "]"}]}], 
       SubsuperscriptBox["r2", "1", "3"]], "-", 
      FractionBox[
       RowBox[{"\[Mu]", " ", 
        RowBox[{
         SubscriptBox["y2", "2"], "[", "t", "]"}]}], 
       SubsuperscriptBox["r2", "2", "3"]]}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"a", " ", "=", " ", "0.55"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"b", " ", "=", "0.0"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"c", " ", "=", " ", "0.0"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"T", "=", "3.07"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"d", " ", "=", " ", 
    RowBox[{"N", "[", 
     RowBox[{"Sqrt", "[", 
      RowBox[{
       FractionBox[
        RowBox[{"2", "-", 
         RowBox[{"2", "\[Mu]"}]}], 
        SqrtBox[
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]", "+", "a"}], ")"}], "2"], "+", 
          SuperscriptBox["b", "2"]}]]], "+", 
       FractionBox[
        RowBox[{"2", "\[Mu]"}], 
        SqrtBox[
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "\[Mu]", "+", "a"}], ")"}], "2"], "+", 
          SuperscriptBox["b", "2"]}]]], "+", 
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox["a", "2"], "+", 
         SuperscriptBox["b", "2"]}], ")"}], "-", "T", "-", 
       RowBox[{"c", "^", "2"}]}], "]"}], "]"}]}], "\[IndentingNewLine]", 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"e", "=", "0.550000001"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"f", "=", "0.00000001"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"g", "=", "0.00000001"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"h", " ", "=", " ", 
    RowBox[{"N", "[", 
     RowBox[{"Sqrt", "[", 
      RowBox[{
       FractionBox[
        RowBox[{"2", "-", 
         RowBox[{"2", "\[Mu]"}]}], 
        SqrtBox[
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"\[Mu]", "+", "e"}], ")"}], "2"], "+", 
          SuperscriptBox["f", "2"]}]]], "+", 
       FractionBox[
        RowBox[{"2", "\[Mu]"}], 
        SqrtBox[
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", "\[Mu]", "+", "e"}], ")"}], "2"], "+", 
          SuperscriptBox["f", "2"]}]]], "+", 
       RowBox[{"(", 
        RowBox[{
         SuperscriptBox["e", "2"], "+", 
         SuperscriptBox["f", "2"]}], ")"}], "-", "T", "-", 
       RowBox[{"g", "^", "2"}]}], "]"}], "]"}]}], "\[IndentingNewLine]", 
   RowBox[{"(*", 
    RowBox[{
     RowBox[{"a", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"R", " ", 
          RowBox[{"Cos", "[", "p", "]"}]}], "/.", "\[VeryThinSpace]", 
         RowBox[{"R", "\[Rule]", 
          RowBox[{"0.5", " ", 
           SqrtBox[
            RowBox[{"3", "+", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"1", "-", 
                RowBox[{"3", " ", "mu"}]}], ")"}], "2"]}]]}]}]}], "/.", 
        "\[VeryThinSpace]", 
        RowBox[{"mu", "\[Rule]", "0.000954"}]}], "/.", "\[VeryThinSpace]", 
       RowBox[{"p", "\[Rule]", 
        RowBox[{"3", " ", "\[Degree]"}]}]}]}], ";", "\n", 
     RowBox[{"b", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"R", " ", 
          RowBox[{"Sin", "[", "p", "]"}]}], "/.", "\[VeryThinSpace]", 
         RowBox[{"R", "\[Rule]", 
          RowBox[{"0.5", " ", 
           SqrtBox[
            RowBox[{"3", "+", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"1", "-", 
                RowBox[{"3", " ", "mu"}]}], ")"}], "2"]}]]}]}]}], "/.", 
        "\[VeryThinSpace]", 
        RowBox[{"mu", "\[Rule]", "0.000954"}]}], "/.", "\[VeryThinSpace]", 
       RowBox[{"p", "\[Rule]", 
        RowBox[{"3", " ", "\[Degree]"}]}]}]}], ";", "\n", 
     RowBox[{"c", "=", 
      RowBox[{
       RowBox[{"0.3", ";;", "\n", "d"}], "=", 
       RowBox[{"-", "0.3"}]}]}], ";", "\n", 
     RowBox[{"dx0", "=", "0.001"}], ";", "\n", 
     RowBox[{"e", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"R", " ", 
          RowBox[{"Cos", "[", "p", "]"}]}], "/.", "\[VeryThinSpace]", 
         RowBox[{"R", "\[Rule]", 
          RowBox[{"0.5", " ", 
           SqrtBox[
            RowBox[{"3", "+", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"1", "-", 
                RowBox[{"3", " ", "mu"}]}], ")"}], "2"]}]]}]}]}], "/.", 
        "\[VeryThinSpace]", 
        RowBox[{"mu", "\[Rule]", "0.000954"}]}], "/.", "\[VeryThinSpace]", 
       RowBox[{"p", "\[Rule]", 
        RowBox[{"4", "\[Degree]"}]}]}]}], ";", "\n", 
     RowBox[{"f", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"R", " ", 
          RowBox[{"Sin", "[", "p", "]"}]}], "/.", "\[VeryThinSpace]", 
         RowBox[{"R", "\[Rule]", 
          RowBox[{"0.5", " ", 
           SqrtBox[
            RowBox[{"3", "+", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"1", "-", 
                RowBox[{"3", " ", "mu"}]}], ")"}], "2"]}]]}]}]}], "/.", 
        "\[VeryThinSpace]", 
        RowBox[{"mu", "\[Rule]", "0.000954"}]}], "/.", "\[VeryThinSpace]", 
       RowBox[{"p", "\[Rule]", 
        RowBox[{"4", "\[Degree]"}]}]}]}], ";", "\n", 
     RowBox[{"g", "=", "0.3"}], ";", "\n", 
     RowBox[{"h", "=", " ", 
      RowBox[{"-", "0.3"}]}], ";"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"tin", "=", "0."}], ";"}], "\n", 
   RowBox[{
    RowBox[{"tfin", "=", "300."}], ";"}], "\n", 
   RowBox[{
    RowBox[{"tstep", "=", "0.05"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"acc", "=", "12"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"lcedata", "=", 
     RowBox[{"{", "}"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{"sum", "=", "0"}], ";"}], "\n", 
   RowBox[{
    RowBox[{"d0", "=", 
     SqrtBox[
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"a", "-", "e"}], ")"}], "2"], "+", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"b", "-", "f"}], ")"}], "2"], "+", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"c", "-", "g"}], ")"}], "2"], "+", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"d", "-", "h"}], ")"}], "2"]}]]}], ";"}], "\n", 
   RowBox[{"For", "[", 
    RowBox[{
     RowBox[{"i", "=", "1"}], ",", 
     RowBox[{"i", "<", 
      FractionBox["tfin", "tstep"]}], ",", 
     RowBox[{"i", "++"}], ",", 
     RowBox[{
      RowBox[{"sdeq", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y1", "1"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq1"}], 
         ",", 
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y1", "2"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq2"}], 
         ",", 
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y1", "3"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq3"}], 
         ",", 
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y1", "4"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq4"}], 
         ",", 
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y2", "1"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq5"}], 
         ",", 
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y2", "2"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq6"}], 
         ",", 
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y2", "3"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq7"}], 
         ",", 
         RowBox[{
          RowBox[{
           SuperscriptBox[
            SubscriptBox["y2", "4"], "\[Prime]",
            MultilineFunction->None], "[", "t", "]"}], "\[Equal]", "deq8"}], 
         ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "1"], "[", "0", "]"}], "\[Equal]", "a"}], ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "2"], "[", "0", "]"}], "\[Equal]", "b"}], ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "3"], "[", "0", "]"}], "\[Equal]", "c"}], ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y1", "4"], "[", "0", "]"}], "\[Equal]", "d"}], ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "1"], "[", "0", "]"}], "\[Equal]", "e"}], ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "2"], "[", "0", "]"}], "\[Equal]", "f"}], ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "3"], "[", "0", "]"}], "\[Equal]", "g"}], ",", 
         RowBox[{
          RowBox[{
           SubscriptBox["y2", "4"], "[", "0", "]"}], "\[Equal]", "h"}]}], 
        "}"}]}], ";", 
      RowBox[{"sol", "=", 
       RowBox[{"NDSolve", "[", 
        RowBox[{"sdeq", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            SubscriptBox["y1", "1"], "[", "t", "]"}], ",", 
           RowBox[{
            SubscriptBox["y1", "2"], "[", "t", "]"}], ",", 
           RowBox[{
            SubscriptBox["y1", "3"], "[", "t", "]"}], ",", 
           RowBox[{
            SubscriptBox["y1", "4"], "[", "t", "]"}], ",", 
           RowBox[{
            SubscriptBox["y2", "1"], "[", "t", "]"}], ",", 
           RowBox[{
            SubscriptBox["y2", "2"], "[", "t", "]"}], ",", 
           RowBox[{
            SubscriptBox["y2", "3"], "[", "t", "]"}], ",", 
           RowBox[{
            SubscriptBox["y2", "4"], "[", "t", "]"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"t", ",", "0", ",", "tstep"}], "}"}], ",", 
         RowBox[{"MaxSteps", "\[Rule]", "\[Infinity]"}], ",", 
         RowBox[{"Method", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"\"\<ExplicitRungeKutta\>\"", ",", 
            RowBox[{"\"\<DifferenceOrder\>\"", "\[Rule]", "8"}]}], "}"}]}], 
         ",", 
         RowBox[{"PrecisionGoal", "\[Rule]", "acc"}], ",", 
         RowBox[{"AccuracyGoal", "\[Rule]", "acc"}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"xx1", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y1", "1"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"yy1", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y1", "2"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"zz1", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y1", "3"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"kk1", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y1", "4"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"xx2", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y2", "1"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"yy2", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y2", "2"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"zz2", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y2", "3"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"kk2", "[", "t_", "]"}], "=", 
       RowBox[{
        RowBox[{
         SubscriptBox["y2", "4"], "[", "t", "]"}], "/.", "\[VeryThinSpace]", 
        RowBox[{
        "sol", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"d1", "=", 
       RowBox[{"\[Sqrt]", 
        RowBox[{"(", 
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"xx1", "[", "tstep", "]"}], "-", 
             RowBox[{"xx2", "[", "tstep", "]"}]}], ")"}], "2"], "+", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"yy1", "[", "tstep", "]"}], "-", 
             RowBox[{"yy2", "[", "tstep", "]"}]}], ")"}], "2"], "+", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"zz1", "[", "tstep", "]"}], "-", 
             RowBox[{"zz2", "[", "tstep", "]"}]}], ")"}], "2"], "+", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{"kk1", "[", "tstep", "]"}], "-", 
             RowBox[{"kk2", "[", "tstep", "]"}]}], ")"}], "2"]}], ")"}]}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"sum", "+=", 
       RowBox[{"Log", "[", 
        FractionBox["d1", "d0"], "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"dlce", "=", 
       FractionBox["sum", 
        RowBox[{"tstep", " ", "i"}]]}], ";", "\[IndentingNewLine]", 
      RowBox[{"AppendTo", "[", 
       RowBox[{"lcedata", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"tstep", " ", "i"}], ",", 
          RowBox[{"Log10", "[", "dlce", "]"}]}], "}"}]}], "]"}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"w1", "=", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"xx1", "[", "tstep", "]"}], "-", 
           RowBox[{"xx2", "[", "tstep", "]"}]}], ")"}], " ", "d0"}], "d1"]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"w2", "=", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"yy1", "[", "tstep", "]"}], "-", 
           RowBox[{"yy2", "[", "tstep", "]"}]}], ")"}], " ", "d0"}], "d1"]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"w3", "=", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"zz1", "[", "tstep", "]"}], "-", 
           RowBox[{"zz2", "[", "tstep", "]"}]}], ")"}], " ", "d0"}], "d1"]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"w4", "=", 
       FractionBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"kk1", "[", "tstep", "]"}], "-", 
           RowBox[{"kk2", "[", "tstep", "]"}]}], ")"}], " ", "d0"}], "d1"]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"a", "=", 
       RowBox[{"xx1", "[", "tstep", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"b", "=", 
       RowBox[{"yy1", "[", "tstep", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"c", "=", 
       RowBox[{"zz1", "[", "tstep", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"d", "=", 
       RowBox[{"kk1", "[", "tstep", "]"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"e", "=", 
       RowBox[{"a", "+", "w1"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"f", "=", 
       RowBox[{"b", "+", "w2"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"g", "=", 
       RowBox[{"c", "+", "w3"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"h", "=", 
       RowBox[{"d", "+", "w4"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"i", "=", 
       RowBox[{"i", "++"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"Mod", "[", 
          RowBox[{
           RowBox[{"tstep", " ", "i"}], ",", "50"}], "]"}], "\[Equal]", "0"}],
         ",", 
        RowBox[{"Print", "[", 
         RowBox[{"\"\< For t = \>\"", ",", 
          RowBox[{"tstep", " ", "i"}], ",", "\"\< , \>\"", ",", 
          "\"\< LCE = \>\"", ",", "dlce"}], "]"}]}], "]"}]}]}], "]"}], "\n", 
   RowBox[{"S2", "=", 
    RowBox[{"ListPlot", "[", 
     RowBox[{
      RowBox[{"{", "lcedata", "}"}], ",", 
      RowBox[{"Frame", "\[Rule]", "True"}], ",", 
      RowBox[{"Axes", "\[Rule]", "False"}], ",", 
      RowBox[{"PlotRange", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"10", ",", "300"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "1.00"}], ",", "0.00"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"Joined", "\[Rule]", "True"}], ",", 
      RowBox[{"FrameLabel", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{
        "\"\<\\!\\(\\*SubscriptBox[\\(t\\), \\(din\\)]\\)\>\"", ",", 
         "\"\<\\!\\(\\*SubscriptBox[\\(log\\), \\(10\\)]\\)(LCE)\>\""}], 
        "}"}]}], ",", 
      RowBox[{"FrameStyle", "\[Rule]", 
       RowBox[{"Directive", "[", 
        RowBox[{"\"\<Helvetica\>\"", ",", "17"}], "]"}]}], ",", 
      RowBox[{"ImageSize", "\[Rule]", "550"}]}], "]"}]}]}]}]], "Input",
 CellChangeTimes->{{3.6006901024184666`*^9, 3.600690105353635*^9}, {
   3.6006901885583935`*^9, 3.600690199436016*^9}, {3.600690298754697*^9, 
   3.6006903124674807`*^9}, {3.6009571883382263`*^9, 3.600957263340516*^9}, {
   3.604652647402878*^9, 3.604652688930151*^9}, {3.60465272254821*^9, 
   3.6046527571334705`*^9}, {3.604652813059569*^9, 3.6046528186443787`*^9}, {
   3.604652890123704*^9, 3.6046528903421044`*^9}, {3.604652938592989*^9, 
   3.604652952726614*^9}, {3.604653025079541*^9, 3.6046530283243465`*^9}, {
   3.6046530768872323`*^9, 3.6046530770744324`*^9}, {3.604653133047331*^9, 
   3.6046531345605335`*^9}, {3.6046531844182215`*^9, 3.604653199316247*^9}, {
   3.6046532340419083`*^9, 3.604653307268437*^9}, {3.6046533615097322`*^9, 
   3.604653381633767*^9}, {3.6046534341746597`*^9, 3.6046534435502763`*^9}, {
   3.604653499367174*^9, 3.6046535006307764`*^9}, {3.604653553171669*^9, 
   3.604653563280486*^9}, {3.6046536122177725`*^9, 3.6046536141365757`*^9}, {
   3.6046536739938807`*^9, 3.6046536788610897`*^9}, {3.604653725302371*^9, 
   3.604653726534773*^9}, {3.6046537843640747`*^9, 3.6046537866728787`*^9}, 
   3.6046538472321854`*^9, {3.604653932501935*^9, 3.6046539454031577`*^9}, {
   3.6046540073508663`*^9, 3.604654016539283*^9}, {3.6046540889078093`*^9, 
   3.6046540927298164`*^9}, {3.6046541678127484`*^9, 3.604654186844782*^9}, {
   3.6046542510544944`*^9, 3.604654251803296*^9}, {3.6046543142658052`*^9, 
   3.6046543695523024`*^9}, {3.6046544316596117`*^9, 3.604654506992144*^9}, {
   3.604654562407441*^9, 3.6046545688346524`*^9}, {3.60482105737904*^9, 
   3.6048210578470407`*^9}, {3.6048211243499575`*^9, 
   3.6048211267055616`*^9}, {3.604821191523675*^9, 3.604821195033682*^9}, {
   3.604821256294989*^9, 3.6048212600701957`*^9}, {3.604821400985243*^9, 
   3.604821408785257*^9}, {3.604821455398139*^9, 3.6048214808105836`*^9}, {
   3.6048215271270647`*^9, 3.6048215600743227`*^9}, {3.6048216299780455`*^9, 
   3.6048216334100513`*^9}, {3.6048217042809763`*^9, 
   3.6048217120965896`*^9}, {3.604821774044298*^9, 3.604821856038042*^9}, {
   3.6048219164725485`*^9, 3.6048219991370935`*^9}, {3.6048222548215427`*^9, 
   3.6048222934628105`*^9}, {3.6048223382504897`*^9, 
   3.6048223394360914`*^9}, {3.6048223752693543`*^9, 3.6048224026786027`*^9}, 
   3.604822462395508*^9, {3.604822557118874*^9, 3.604822562734884*^9}, {
   3.604822705116334*^9, 3.604822708283139*^9}, {3.60482274839081*^9, 
   3.604822771775251*^9}, {3.6048228370145655`*^9, 3.60482283954177*^9}}],

Cell[BoxData["0.9291679308958984`"], "Output",
 CellChangeTimes->{
  3.600690401853594*^9, 3.600957184999035*^9, 3.604652804214353*^9, 
   3.604652861076453*^9, 3.604652929888174*^9, 3.6046529938482866`*^9, 
   3.604653069274419*^9, 3.604653116729702*^9, 3.6046531758694057`*^9, 
   3.604653243401925*^9, 3.604653422271839*^9, 3.6046534861539507`*^9, 
   3.604653540878847*^9, 3.6046536039341583`*^9, 3.6046536562254496`*^9, 
   3.6046537197019615`*^9, 3.60465377021485*^9, 3.6046538304465556`*^9, 
   3.604653896590672*^9, 3.604653995994046*^9, 3.6046540625281634`*^9, 
   3.604654139030698*^9, 3.604654242209279*^9, 3.6046543063565917`*^9, 
   3.6046544221903954`*^9, 3.6046545125613537`*^9, 3.604654569755054*^9, 
   3.604821060327445*^9, 3.604821127750763*^9, 3.6048211964064837`*^9, 
   3.604821262831401*^9, 3.6048214100332594`*^9, 3.6048214871909947`*^9, 
   3.604821635438055*^9, 3.6048217136877923`*^9, {3.604821792436731*^9, 
   3.604821820969181*^9}, 3.6048218591580477`*^9, 3.604821936487384*^9, 
   3.6048219999326954`*^9, 3.6048222615451546`*^9, 3.6048223086260376`*^9, 
   3.604822341666896*^9, 3.604822406126209*^9, 3.6048224633783092`*^9, 
   3.6048225633432846`*^9, 3.6048227102799425`*^9, 3.6048227726644526`*^9, 
   3.6048228417569737`*^9}],

Cell[BoxData["0.9291679279508194`"], "Output",
 CellChangeTimes->{
  3.600690401853594*^9, 3.600957184999035*^9, 3.604652804214353*^9, 
   3.604652861076453*^9, 3.604652929888174*^9, 3.6046529938482866`*^9, 
   3.604653069274419*^9, 3.604653116729702*^9, 3.6046531758694057`*^9, 
   3.604653243401925*^9, 3.604653422271839*^9, 3.6046534861539507`*^9, 
   3.604653540878847*^9, 3.6046536039341583`*^9, 3.6046536562254496`*^9, 
   3.6046537197019615`*^9, 3.60465377021485*^9, 3.6046538304465556`*^9, 
   3.604653896590672*^9, 3.604653995994046*^9, 3.6046540625281634`*^9, 
   3.604654139030698*^9, 3.604654242209279*^9, 3.6046543063565917`*^9, 
   3.6046544221903954`*^9, 3.6046545125613537`*^9, 3.604654569755054*^9, 
   3.604821060327445*^9, 3.604821127750763*^9, 3.6048211964064837`*^9, 
   3.604821262831401*^9, 3.6048214100332594`*^9, 3.6048214871909947`*^9, 
   3.604821635438055*^9, 3.6048217136877923`*^9, {3.604821792436731*^9, 
   3.604821820969181*^9}, 3.6048218591580477`*^9, 3.604821936487384*^9, 
   3.6048219999326954`*^9, 3.6048222615451546`*^9, 3.6048223086260376`*^9, 
   3.604822341666896*^9, 3.604822406126209*^9, 3.6048224633783092`*^9, 
   3.6048225633432846`*^9, 3.6048227102799425`*^9, 3.6048227726644526`*^9, 
   3.6048228417569737`*^9}],

Cell[CellGroupData[{

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\" For t = \"\>", "\[InvisibleSpace]", "50.`", 
   "\[InvisibleSpace]", "\<\" , \"\>", "\[InvisibleSpace]", "\<\" LCE = \"\>",
    "\[InvisibleSpace]", "0.542699381697453`"}],
  SequenceForm[" For t = ", 50., " , ", " LCE = ", 0.542699381697453],
  Editable->False]], "Print",
 CellChangeTimes->{3.604822780760867*^9, 3.604822849900188*^9}],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\" For t = \"\>", "\[InvisibleSpace]", "100.`", 
   "\[InvisibleSpace]", "\<\" , \"\>", "\[InvisibleSpace]", "\<\" LCE = \"\>",
    "\[InvisibleSpace]", "0.5303948074940741`"}],
  SequenceForm[" For t = ", 100., " , ", " LCE = ", 0.5303948074940741],
  Editable->False]], "Print",
 CellChangeTimes->{3.604822780760867*^9, 3.6048228580434027`*^9}],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\" For t = \"\>", "\[InvisibleSpace]", "150.`", 
   "\[InvisibleSpace]", "\<\" , \"\>", "\[InvisibleSpace]", "\<\" LCE = \"\>",
    "\[InvisibleSpace]", "0.5283894988381671`"}],
  SequenceForm[" For t = ", 150., " , ", " LCE = ", 0.5283894988381671],
  Editable->False]], "Print",
 CellChangeTimes->{3.604822780760867*^9, 3.6048228677466197`*^9}],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\" For t = \"\>", "\[InvisibleSpace]", "200.`", 
   "\[InvisibleSpace]", "\<\" , \"\>", "\[InvisibleSpace]", "\<\" LCE = \"\>",
    "\[InvisibleSpace]", "0.5365532447373237`"}],
  SequenceForm[" For t = ", 200., " , ", " LCE = ", 0.5365532447373237],
  Editable->False]], "Print",
 CellChangeTimes->{3.604822780760867*^9, 3.6048228775746365`*^9}],

Cell[BoxData[
 InterpretationBox[
  RowBox[{"\<\" For t = \"\>", "\[InvisibleSpace]", "250.`", 
   "\[InvisibleSpace]", "\<\" , \"\>", "\[InvisibleSpace]", "\<\" LCE = \"\>",
    "\[InvisibleSpace]", "0.529556383670583`"}],
  SequenceForm[" For t = ", 250., " , ", " LCE = ", 0.529556383670583],
  Editable->False]], "Print",
 CellChangeTimes->{3.604822780760867*^9, 3.604822887465054*^9}]
}, Open  ]],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.24720000000000014`, 0.24, 0.6], 
     LineBox[{{0.05, -0.22823546078718818`}, {0.1, -0.16192474775029148`}, {
      0.15000000000000002`, -0.17826297657117998`}, {
      0.2, -0.2634068596973473}, {0.25, -0.4324792951571278}, {
      0.30000000000000004`, -0.7828126006956865}}], LineBox[CompressedData["
1:eJxTTMoPSmViYGBQAGIQvYZV5uO6c5/sGcDgw34TYxD4bG8526Xsw6NX+yHi
X+znFV/ccCD46f6zZ0Dgi/2y/TNP2C54uH/WTBD4ar/zmP7iHVfv7k9PA4Fv
9h1z7+k0LL8JNe+7vcONVVOWBVyDmvfDni3cbu/HKZeh5v2wP7vmXlqj70Wo
eT/tJ8kwM9fvPwc175e9+l6x+MTC01DzftuHWqQoLZlyAmreH3vDkw9uc4oc
g5r3x16oz7FP7v5hqHl/7YUOLch6/uIg1Lx/9hsLNTf9VTsANe+/fZXNfLU7
inuh5jE4BPG6femy3wVVz+Cwrmn3rsrZ26HmMzhontbP/Kq9dT9YuzGjw/Nd
hkYnXmyC2sfoEPNp+YpPpzZAzWNyuOrqf/TNjLVQ85gcantrXkRfWAk1j8mB
o3VfQ7zxMqh7mB1OTXS0Kd61CGoes0P259DqCfvmQc1jcfhy6iF3keUMqHks
Dh+OhtlMvjsRah6LQ2GW+/IzXu1Q81gdMnaEP7tiXra/t26N+8RJrA5QfzIA
AOGR8vQ=
      "]], LineBox[CompressedData["
1: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
24FfFhrJkX2myKz+NOfHX/Y88qYIWhpm9usLe35VU4TGqKWv/8D8pWuKnrnx
SnffNLP7jSmeyVx0+9fB/AdT2FpPDlB+Q/42RW2t5U6VTsYLMYU3qk3/fSb/
m+KqfFFByW/GizNFfFqxiaIsPa8p1oSNff92JHueNFOsMzKw+6hHz28Ky9ln
551zYM931BQvfpxxqQ1qYfclU+yZt3rU9JmMV2UKzsO3f04vJf+YwuzzowXF
mxjvgSnmz+m5y88mf5kiLnDBuHV5jNdjCtX979/EFpP/zDD99aKe/DLGkzcD
73J3pLCM1tsMo6yM0g2LGU/XDFdVnZM3n2Q8CzPcP7p0lcNhxoMZ3N5tGmKy
n+LBDA61xX0m7WW8EDNEdcZ8jdlH8WGG2PyxgpwjjBdnhie/NuTPKCX/mcF/
sfVtuXrynxlOvNGXXv+M/GeGAwMcWqf8JP+ZYVCNc+mmoXeY/8zw6Hdc1Gr1
O8x/Zph2ZYyZn94d5j8zyKucyxSY32H+M4PW0IenGj3uMP+ZIbHWYuOs2YzX
Y4bhTa6LSg8znpQ59o68NTn9H+PJm+NXpuJe8xV3mf/MsfTT6OMRI1uZ/8zR
Mfa9+PW5VuY/c3hMHv5jld495j9z3O3YOr915D3mP3PUby4pKtvbyvxnju7B
Nqsf/L3L/GeO2g+P1uVG3WX+M0eTgb2c/VtmX6I5cr8Zdb1JYPalmeP1ZP/1
Z1XZ82ZJ7ElyCHh8lfxnDmMbv2LzFRR/5nj5YqK/pgPFnznWvLupsbIPxZ85
bEb+eTfjBtsfD8xRXd8wXCOX7Y8Oc9QEGX0Zl8D2R4+Ed22aXLeI7TcpCzzq
PNmlYUP71wKn2kLzxGq0fy0wo0VG7Nqf9q8Fah0mHc/qZnprYYH20buvaDxj
egoLfHryZtqBFqa//hZY59zS+/Ia09cQCa9wsk5dFem7BaZ+PnBX4zzjxVmg
dOXXY7fPkt5bYNy7QVoXyxgvzQI26tWv6s+S/lvA4FTVuafnGO+oBXadqlr7
vpLOAwuo/vPraallvCoLvDTNf7/mJp0PFjBvS9j64AHjPbBA3I65V8tf0Xlh
gXl5b/S/fGa8HgskP/ILEfQh/1lC96tMZpoC+c8SO7fGy0CD/GeJL90bhveY
kP8s8fxieY+8C50vluD6zjVv9Sf9s0RIyJqZKyeS/lki//6YY1rTSf8sMXLZ
HfvPs0j/LHG/bPk/mwjGi7PEi3nTt26YTueRJcSvteY+Cma8NEs0jnDP2exD
55MlFn+4UDfThvGOWkLb5b1p3Dg6ryzhsf6H/085xquyxL3VDyYGfCX/WULt
9hOD8+3kP4k9Z+qPJTaS/yxx0mfrueoL5D9LVLqOeb22iM5fK/Td0RKVf5Lx
5K1QffJB/euTdB5bwXqHRvfuYsbTtcJu67YhJ2l9LawQUz/SMLyZ4s8Ka8YG
8n3eUvxZ4Uz9vZez+5L/rPDOe36bvhr5zwq98pnio9bkPysszVb+WCYk/1mh
OKS45c5y8p8VXmb6Hm0uJv9Z4djh9pJRUrR/Jfa1NVVPjqTz1ArDGmrCJ76k
/WsFPe2+R+5PJf2zQmvgo88mh0j/rBDwuSigJJ30zwpDfXJPFvjcYf6zwnH7
iU/af9H5YY342Zt0+p2j88ManhtGN0mn0PlhjY5lj5vcQ+n8sIblw1mXLG3p
/mCNe1+eqz5VpvPDGvZVaUviP1P8WeOPbP/MeY3kP2vY2c48En2I/GcNBTv7
ay+XkP+s8e/T2uMXfMl/ks876xTwTY38Z431k47GLvtE+9caS47V+UjV0P61
Rnjsjpmyu2n/WkO0/5f6m3m0f61h9KnsdL0XxZ81gvf0Ma0aR/En+fzZdfIN
/24x/1nj9rqHqY+fsPtmjzUOuS9a8qLyFvOfDZLM1uy5cpDdP+VtcO1x/uOI
VLqv2qC8j3zb6RjG07VB9QTZu+tEdH+1wYBpRzxvOTMebHD5zXUs1af7rA3O
uF7bP1uZ8UJscMNNefiWvowXYYOU3lmTC57dZP6zwV/3PZdnV7H7c6INSrwS
3pvk3mT+s8EhbumwzuSbzH82qL/4WG3D7JvMfzYwfG5e+i2Q8UpskHPEcZae
DeNV2WDrpfGvlDUZr9EG8689WnRenvEe2EBVr3z+qJ90n7dB7X5Lefu3N5j/
bPDji8I0vYc3mP9s0aHVN/9X4w3mP1t49miNuFN9g/nPFrsrJlY/Lmc8XVsk
+gmXCYoZz8IWuR8uvF9TwHiwxeLO5BkNpxjP3xYtn9q/nCxkvBBblJ3WT7t4
lvEibBG6jXPwXA3jxdlCY7e6/Mq7jJdoi+9Nt3R6PjBemi2uvFy17d9g8p8t
YqYerjCwJv/ZQqq3ZolUBPnPFoXpUXJVe8h/trjmOthc1ET+s4WOzD7bwC7y
ny00n5ivSOxmvA5bHJ2fcv5JDeP12GK7758j6+dSfmSHyy7RjfhN/rNDa/v6
M+pp5D873L40eMDmCeQ/O6h2/r07qb2J+c8OigNjbW9K8rH/+c8OO2IDOnK2
sfzM3w4JF4+Ez97YxPxnh6YswYKO7U3Mf3YoHsSPcTnGeHF2WPnly8FnVxgv
0Q69o5NtSt8xXpodpmnffZSmwuzLsoPJ9K8rgwOZfUftEDRMa/zMTWw9Suyw
yfBjP7kbbD2q7HC6eOm6fYrkPztkBO40SZ9I/rPDq7VbBK27yX92mCmj6zv/
FvnPDgUVStsVf5P/7GGqtzH0tTztX3vY7Bk846AS7V97KEzb31KtTPvXHj+d
Ntx3GUb71x71638buAyk/WuPVSZJnUe+M/v87XHla1x6zQNmX4g98gpS/jqW
M/si7PFU4cXA0Tto/9rj9fbPdmPm0f61x5d4/71NHNq/9pAxz3mQrk7xZ4/h
p0P6FH8l/9ljmfrO8KhG8p89vte92N1xkPxnj93ikjSfBBYvjfa4qnvNryCI
rccDe3zi9Bupr0v71x5De14qXPvN1rfHHoGJgWUZLWx9pRyQ99rfbesJtr7y
Dijwq+pXsYbFi6oDfBqnlA0KYfGi64BpDROuJZhS/DnggbXN6e8DKP4c4OG8
zSi2vZH5zwEfZKV2tZSxekKIA9YvtxshvaWR+c8BTlF9P7+cyeoLcQ5QTm5t
m+RA9QgH3PISBXoMY7w0BxzJcvu+qoPqJxJ7VIsFr8+xesZRyfNwqueGbKF6
igMGfGy5VRTG6iVVDniUUfn2hhnVVxxQ2X/X/u19GO+BA2rsVVa8vHmd+c8B
Y48ERJRms3pPjwO+F07r+hN5nfnPEc0jjOIbzVj9R94R4dez5PCznvnPEdHG
xdEZ1ay+pOuIxwWTOsatZ/UoC0dotDrOXRTI6k1wRH7bokYos/qUvyO4fYsG
r3rM6lkhjnjb1nw46jjVvxzRVi1vl7WE1cviHFH1a+jg3/5UD3NE4jDl7I8T
WP0szRF/OMImeyWqjzniW/m0XCV5xjvqCG11JcM+IxivxBGLZaaZb7ZivCpH
XM4rVtkUw3iNjvDTnnhS4xLjPXBER9/dnaYaVE+T2L9c/trulex5eyT2Oioo
1BdSfc0JMSIDjYcH2fPKOyE+7Jda5GzynxPa1e/dzdEh/zlh2fw3Gsc+UX3Q
CWbO2Vd2NDL74AQ/pUPVweepXuiEh8sMx0SXk/+coOER2fuxkvznBOXfa4yX
3yD/OeHckxi7Vc/If04IiRpt6fmd/OeEiORBux8PYfZlOcHYO4rXPp7Zd9QJ
esc/7rdwo3qjE76lXLHtmMKet0ry+xcOD5FZTvVHJ5T375+1I4vxHjihedSR
a6sryH9O+DNn3IyDD8l/TjCRzd5a95v854xf+98cPj2W4s8Zih4Ff5XcqV7p
jIR0i8WFESyedZ1REmVp4bSR6pfOqJ+nc2H5KRbPcMa9y4U2lreonukMrcX7
7tp8ZrwQZxj8aOROV6T6oTNWNFlm7rBg+y3OGek1b/Zd5FO90xkZzvU7bixg
+y3NGV9SBm24uJn2rzNWmx+pXJNH+9cZc3YZdytcof3rjLy357NCH9P+dcaA
6g3rgr7S/nXGxC7bqw1yTF8eOKN6xQSjPA2mLx3OkPvmtrbUgulLj8RfIR3J
pz2Yvki54N/n3/U8AdMXeReUfdO86TuN8VRdsOzO1acesxlP1wW/Ll3//CaG
8SxccDPQ98fz+YwHF6i9TnHtiCH9c0GfzRXORZGkfy5w8d0kqzCF9M8F7uH9
OI8DSP9ccN97sFEfe9I/F+xw9u47X5P0zwULNfipmv2oPusCsVDkNfI5+c8F
TQdHFwSdJ/+54G9UyP36reQ/F4SlHnu1bhr5zwU95+ynbZhA+ueCF+cLeju6
SP9cIDfw5d76YtI/iX2f5VWTFpD+AUOu71ubOYH9fxlg7EmVJbef0X4Gzjqs
1g/aVf+/+oMioNl9RT7Fn/Y3MOCRSpq3NItnDWAb/1z/SxfZ/tQF1oaEX+et
YvvPEJDheI3a7XWN1W+AD5qJCyeosf1tB4yYeurAyr+svwBg3wy5MaVdrP/A
ASq0556O/sL6E/4SXqPpgtRBjCcATnQuUr9tTnoBlL4dbJUwl+lBGHAoR6mP
QyHpB6AXPypibi+zLxqYpJB7Q8qRPW8c8MRj7ao90ex5E4Av73aMW7KOPW8i
sC6Y53l/A9vvKUAUf6tmRhLzXxqQVT7F2X0p42UAM5tXmycsIP0BdozRz2uJ
YbwcwGCitov0QtIjyect3LM3P4Hx8oHnlc/iv6cwXgnwZoDYpX0X41UA8uXL
hk07SXoFKLs8y95QxXi1wPcZ2mMyW0m/AH7gkqMdnYzXAjwqf3lFVprpxQOg
97dOTLkKi5enkud5f3L4bSOKL6DJub2F68b0phPYtex9o5/4OqtXAX/mGW19
NYfxeoE5taPW+K6k+HPF6tDy7SfSKf5csXFa33Crw6SHrogvuFsyspzxFF3h
627YkdBI+uiKApfzE1Y/YzwNVwyc4azi+Z300hXTNI1DXwxm+8XQFa13Wvzm
6jSw+HNFrNRy7ddObP/YuSJ4S1TrxGC23+AK2Yo8p/KFbH9yXCGclny+K436
Ma4IvJhi/+Q44wlcMXPs1Gs+VxkvxBVHTPoZdDxjvDCJPR46EwL+kv664vvK
V6V/VZk+RLvitOb7BeGWjSz+XFH9Kzjmjj/TiwRXPIz3cM+bQfoi+fzZSsv8
45kepbgi4+mNTMFa0htXvFE0ObFzK+NluGKM1ck2u12kP64o7Am+W76X8XJc
ocTfd/zmPsY76oogDT4ncj/j5buipTavNX4/45W44uhGC/n2/YxX4QrFmulj
xTmMV+UKA5Wq066HGK/WFQv/rCjMOcZ4jZL1nff1TFc+47W4omKDym3VYjoP
XPFk2mlR1BnGe+qKnkBjcUkpnQ+uOGgwbtmuU4zXKXmewM+7Fci+HlfY+D54
Mmwd4/W6YlWVjopcOJ0fbjC+3qU52J7xZNxg8CLi5ZLBdJ64IWDzHA/RM7a+
im5ouOgTe7iC+nVu+FnzKrQpi62vhhvKdln68Ney9dV1w5Juh+vlyyj+3HD0
vO2ozJUUf25Y+9vucV4axZ8bfjzhhX8/SvHnhkPNtSfuXKf4c4PazfLBn+j8
9HfDHqejm7g67HkFbjgRpLp/pYjOKzf0GPhuuJ7EnjfMDTW+jerf8uj8ckP/
l03OL65R/Lmhac3fVMV2ij83FOX+qcv4QPEneZ6fQ1Jnf6P4c8Myx3ld935R
/LnhUnRX8Kt/FH9uaBddSh/Rr4nFnxsUFq0/Pl+W5SdZbtCWmZ26XoHlHzlu
CN34oOi4KstXjrrB3fvok3Ztlt/ku+HXmDWlKuaMV+KGock+33VcGa9C8vuh
7tENPMarcoOOallVTTjj1brhmunAzVcWU//TDZ+rh7ut2ch4LW74uFQ169R+
xnvghrvD5r77V8x4T90w8W3rMYs6xutww6ZhccPlHzFepxu+ZFhpBH9kvB43
uDyKjOySYvldrxvy3i+4UTOc6i/uuD/FuvSmFsv3ZNzxamCNn64l1RPcYSzV
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
2XtkE0KE7L3JyCiySYmEbFJmSEahZKaI7JHf+/P7PsefvZ6e67nv9zj3uc+5
rusdyfdfiZi/qR8fbOf7rwRfn5zaV34n338lcEnstu5pDN9/Jfhe8ixRspfv
vxKMsNq7d/p+vv+KvyfZNFex3r+6BLdWNX/f+DDffyVQ5nzY+CuW778SfLqX
fbZhPPFPgjJyxfGUBOKfBK5NGie2OkH8kyArqearCaeJfxL8OJvy+OB54p8E
l5/Pn3wuhfgnQdtnQ42DbxL/JDg5M3rLyXvEPwn62XXbWu0R8U+C5utad5+a
TfyTIPtR97arnxD/JDhW3ObL42zinwTPl1XbsSWL+CdBnYUPnmmyiH8S6J9m
T97yhPgnwbxdtv4j8oh/EoTOWbYjopD4Jz5v4HXsxG/inwRNsts27sZ6/kAJ
/K//mBrWmv6HBHuz9u887Ef/Q4JxjnkbOwfT/5Cg66zo9QM3WfROgwRvZpZb
eeAY/Q8JSgeEbWpPf3+kBHcz/07SsN5zjARVW8wdv2Yh/Q8Juu/J37VzLOuj
JVjzJR8tpfQ/xPy96jYi91+9tASvh+0cDnf6HxKsHbSlcmpL+h8SrDzefW3d
BpZ48yRYrD5a94M9/Q8Jps7d87dGRfofEljV7OJgLE3/Q4KhNc5cPfOL+CdB
rz1nPCp8Jf6J9aHweOD6kfgnwW3ZQYfmhcQ/CdqfjHmbyX7bWyW4VKFZ+c6v
iX8SpPutSO/6kvgnwcJ9Gz88yCP+ic+hbVw2j/gngc6msMyp58Q/Cf7OaZfx
/jnxT4LYUTldt+YR/yT4WZJd+vQL4p8EHsH+13xeEf/E/jvvuduF+nOyBN6r
ph6ZmE/8k6C13+1lZQuJfxKcWrHkzuMPxD8JTKPSRud9Iv5JUHLn19fKX4l/
EhyuOcfVm/W16eL7yad2m7j+7klwenfiecVf4p8Eo9td22TFfuSPJJjTyie6
ozX9DwkaLjkw+nZZ+h9iPB30Q0+Us8xvngQnjk9clVmO+S8SDHiVcLdpOea/
SOCU67xsH+MVSPBnQc2GU0sz/0WCdvWjayb8Jf6J8StVK3Mx84e+SuDwPf6C
8w/inwQbdoXtvsl+778lOH6v08fdn4h/UrivvHfv5QfinxSmJJcyyYXEPykm
x344P6SA+CfF87Ce62+9I/5JUdfnd5MBBcQ/KWxmlNudzfmoLkVb2/trw4uI
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
3Cf/M+GUY+GbqLvkfyaEds3I90kn/xP7K1N2rDn9/SQTklyt4vvcIP8TeH5j
8snoa+R/JmRo2tu7p5H/mTDmTaeRpVPJ/0yYUrDnXtmr5H8mTI+zvd6D5yNf
MKHd1pPOcVfI/8R+T5vXRnKF/E/sl313jZ2ukP+ZcHfmzGS/K+R/JlT40Sgo
8gr5nwkfb8rvNUsh/xOfL81ZXcDzYW6Y4N94UPOPV8n/TNhxf+JNtzTyP/G8
nZVcPuka+Z8JD3pP/xp6g/zPhGaJvWVTb5H/mbDQuKjKfo5fpgnBcxe8smL+
1UOBd50NqaPprz4SzzO7+M6XH5D/mRAv+ej5iPkW2Sb86DD0yAj2W3hqwpY9
5fs34/kzOQKPv745cjmL/E/Emx/gVfMx+Z/4/3NeL+wfkP+J/fo8Ivz9XfI/
cX1JS86X5vy+Ees5vprL2VTyPxMebux0buUl8j8T5jdtvPg+z68uMGGb8sjt
3FPkfyYcnCbd8IF8qEjg1dPtts3Jhz6asHHhuLXrj5P/ieebvkaxSyL5n3ie
uU0JvXmC/M+EIze+BXY+Rf4n7k/h/aUb8wl/iOfh+7f77rGfxC8TnIMT7nTg
evltwtw1Dq3PXSP/M2Fgua1u7++Q/5lh8yGkkiPHz8qMo6EFxjDutzJm5OQO
vZTM/lTWZpQs9kpP4vO3nBm7c1VdThIPbMz40+h0v8zq7Jdlxsu8QZd62Fvw
oJIZZXLGJwRUYv8sM/rty/o9ns8jWzN+lHhFreB5LNXMqNo98NdgnkduZ8aV
kxp1+lvyPzNmTDg54R3xoIYZ2zcMvzuT+XW1zIirZ/MgiPl6dcwY+rvRgbXp
9H/NeDTu4uoP3L/1zZCtD/obwvFzMOO0aXuk03n6v2bUve6xvojz4WhGSO03
o54zP8fJjNl13zT7Fsd+DWaYh6gzXA7R/zWjSkHcgCXsN9PcjCUFNnbl2J+m
pRnq89L+Mf/62Zgxae+s23r292htxoc1i1wRQf/XjE7lxqR1XUv/14zyth8v
B/C8ifZmfIk85Rq+lPl/Zrjda1vu6kL2fzDDv6GhZZN5zP8zw8+m76S1PJ/L
3YyIHr1O2YeR/5lh/FV4PXoa+Z8ZM1t8mdSd54V1MyOjaV5YXjD5nxn3Sn2N
X8N8ai8zBn5dmdub778Qv7/qRM4f9qfzNmNKrmr1CSP5nxmzos++mKCj/yvW
Z80qRS3U9H/N2G/u8fExzzfwNaNyi19BiyX0f804sm5ou3bDLPH8zEiofyfq
VgDz/8xo+/3xBTP1jUFmPDsXMfM78w8CxPXN+Fq4oA/z/8y4uO98oj3Pax9q
htIvKiSG5+8NM+OuXWJ/H+bzB5rhXWAO+9mF+X9mnBw/1eNRJ+p/Yn25mKYX
d6D+Z8bkYZf+6tmvRGlGrF+iwdeF+p8ZeyMHNr3B/iVaM6ada2NuxH7+OjPa
5Z948F//hf/xPzPORDr3cXKh/meGV89Gowa6Uv8zo+u+DbObMT9ihBmKi4Gt
Z7N+YaQZ24bobcfxfkeb8evXyO4nfan/if30QGc9uh/1PzNK+16I2sDz/SaY
0ef4tOvrGC9Y7Jdjxm5a6nWTzBiXZ5uzpy31PzOG//E8/LYl9T8zJg4bP8S+
OfU/M+yC36+7Sb821IyxsQVzTjal/mfGwZGrwmfyPIMwgQ8lzl0z2c9llhmb
425Fb2pJ/c+MByvOd4l1pv5nxlpz1Ywqban/mZEectTrWDvqf2bIc/re3s7z
FBaaEfYqcUJqJ+p/ZjRyXLS9Jc+PXGJGqhXWJnhS/zOjSRmDteKf/ifwTxvi
VLUX9T8zigb0m3+uL/U/M3D7taOS+tUaM2z/TK+ROYj6n8CTyAX+jkOo/5nR
o9OTKu2HU/8T+312d/s/Eup/ZnQIGBU1h/k5m80YFL6x6ykl9T8zfBfbuu5m
P5+tYr7Gva/TU0v9z4ytrYK81+io/5nRcf37buv+1X+YcTzswnxfnoe+S+zn
9dFD4g3kf2J9LXi6/Cbzh/YIvO/9JmergfxPfL9Po/cNDeR/Zoy4opgxVE/+
Z0b3CmcOdCUeHDLjRH+5030N+Z8Z1m/KOjRlPlKcGc0Tk8e2UpL/mdHbSTXi
tYz8z4xbna4maFnvcsyMIas6193E8zcSxf6fm91v9WDyPzMOvf+2x4/1MyfN
uFR1ZbUb1E9PmzHvt/GsPfXOZDMy87XNHKnHnjXjnfXC/GIv8j+xHt91ebGc
53leEJ/nBzu/5fmfl8z4NniLezlX8j/x/HwZUSO3NfmfGUufbNwzhfsj1Qyf
mpF/LjEfKc2MnsprqSn1yP/E83TQ6+yZNcj/zMh1q3n/bRXyPzG/g/OvVylP
/mfGvoS+rYt4XusdMyoEt10ZSf/jnsAfj7mHG9FPyRDPpz3+fmvZvzVT4PW3
aRWrsT//QzEerodrn2F/2EdmjOksD79yj/6vGQ+N3pVUN+n/mtHqW2vj2av0
f83otj5kXCvWD+aIv9vW35xDfyvXjAHtfSo1o7+VZ0abL8cHuZ6l/2vG46cN
w11Zj/jKjPa9FLvcL9P/NcPzZju54zX6v2ZEXb6eMoX+2zvBF0K7z+pCf7XA
jFU1Clbcfkb/14zW15wdovPo/4rxyjvxwvkF/V8zzpZv00P9nP6vGYWuDTrG
P6P/a0b0vIoDujyh/yueL4+3fQnNov9rxvUnO50iOX4/zChY3afFysf0f81I
fPr3drss+r9iPe+8czHwn/8rntdv8xVZrG8sFQTFVPPmSNY3WgWhfpOA52G5
9H+DUPuP68QxrG+0DkKXtzbpap6nUC4I217t2THoNf3fIBQUXnPoxvywCkF4
4XRjafN39H+D8NHd626NQvq/QXhZZe+Yih/o/wYhq9PP3ZXo51ULQm7uImeH
f/5vEGzkzdO9mK9SPQgud/su+i/f6X/8LwiZ21IMF37Q/w1C3w974hqzv0+d
INSYYFtucwn93yA0aPlG0cSK/C8IQ5wdap1nvplDENqWXWUzlv2iGgahid3Z
iS1Yj+gYhIPb5ha/Y32jUxBej0uckmhL/heEafO1jebSf2sahBNdanTsV4P8
LwjpdRtVLlub/C8IhjFv68UyX6qV+D31w5JuzB9qHQSjtvH53ewH3CYI+y+Z
2z93JP8LwsXY4IlvGpP/BSE08POOOD4vXYMwoUuDaW7Nyf+C4Hcs5vt4+m9u
Qbhw9/sZHZ+/7kE49PZ5pUrs39QlCPUW/Bg7vhX533/XO+/jOvZP6xaER1/7
VJrFflyeQVj4aW6fDq3I/4Iwo1D+5CifvwhC09/N5SUtyP+CcO7YTb1tC/K/
IOyaPeNBJp/nvYIwdWj12b2Zz9UnCOvVz1b35P36ir+7dJ5y9F+/sSB0jF1X
OZTj5xeE5k+ajJnFfMwBYv28aXD6GP3QQUFofWt46YasXw0Iwrf+YSvT2S96
cBBWdlZN+16K/C8IS2ZPXX//B/3fIFTwCa6cyHyBwCD07H78xvt39H+DUCb+
kezeS+b/BSG1VveZsTnM/wvCRMXDpGSeH6IU19Oo9oOWrE9WB8HhrERV8dH/
8XTdATm+31uplBmRlURFlBLZ61hJhZKMsqJ69/s+r4iMhKQohVA0jIyEJNKg
pSEVRRJZSSmSzDTwuz+/73v586ZOz3OPc1/Pdc65DvL/eFStoj7V7Rny/9h6
bciuHFGJ/D8eqd6+HmvxCvl/PHLx9jhni/wDdx7Z0k/BEJxfPo/aGwTKNsjf
EPBIb33ZaDvEz0Xs/T1Gjkn+Af0XHqklvNEfjvMm5VHTXh2HLW3Qf2H7Y/Ws
fTnQV5PzKM9dx3vRb+in8Uj2LuKK8Df0X9j593m/bTXi5548cvv4Zexa5LNu
YX+/d8P+Q6h39uJRYaGhSAV639t4lKkh8cn4A/0XHrV9Ne6cjXxHbx69iBh8
Vg163D48OvPhm/5exON3Mf/XtaRqLOLxe3g0Jy9jlzrqp315tPTuosBfnYD/
eNR5wOaXLfAH/jzqdqlIuSP6YQUwf3JlR0gX+IMD7O/7FMq6agL/8Uigdt2g
A/T8DvLowJB21ep/+X9s/T79dknsA/zH9qvllgPyf/pubL3MIosGI58wlP19
S6+Z2dAbPMaj+DHxkat1gP94lPjdrroN+mrhPMq3mat5ZjDwH496vBuQtwL6
hhHs/3vPbzDWB/7j0bjW21ZDDIH/2Pnu1V9lFs7vabbeDr/Uj8IfnOVR14we
hoOhBxfDo1On+hRX4XvmPPP/A7VdnpkD//FoydKnL1stgP94lLT2rI45+nnH
sfuo1GO20xTgPx4tqj7aYDkd+I+tR2ZG6B0C/mP2tlvU+CKenMDun8euURvx
PZPInvdG5xH7EE++wSPK1Ptehfh+EvN3CYs+PJgJ/Mejz8O6D4hD//AUHi00
9TUuQ//yNB7tCu+18CS+B2/zSHdL7ZLpBPzHo+NPKpa8g71MHoWcnPHixBzg
Px6ZRZkNW2wF/MejlyPPr6lAPD6HR79+lhmV2wP/sfthhtO3kqXAf+w+GuDq
MckZ+I/ZMxO4BKwG/uPRjsTAGYK1wH88qjAV/b4PfP+A+aOM4uQ61HeX8Ghl
7VL9kehXWMqj572mP1PG98JjHvVcbB39bAX4Px5F/dL92I5+8OXs5z9k2p7G
81XwqHvIz/vvHMH/8ehw8KbEx47g/9j9bGqpLUH/whc8ium/zvI87L3ikWSN
xiLJCvB/PBoa4hV8Ce9bxaOtflsLZ+J9q3mU1mDcVQvfC+/Y33+mm9iG749a
hl+G8PpXuIP/49G5QdqNewXg/3iUXHFi0nsR+D8ebZpHe2pQL97Ao/N272Zv
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
L/5ESo2gVz9eShda5jtfQn/2iVK6LDOZpi8C/yclzTXug6NRHz9FShK+i9lw
Mfg/KRVr3VTNFoP/k9ICE4ceGyXg/6TUfE6tZYYU/B97Hqs13YbLwP9Jqf1Q
hvcI1LPPkZLfsm0RlqiPt2Tz63D7+3bkR1hJKSZtift9D/B/bH7j1w0zgT6h
jZRi+99Nj0J9ma2UOrv/6ay7BfyflBYFD5hyzgv8n5SOhvSoMUV8xl5KLtVV
pjcRf3Ng7/N0/sAxiPcskdI8zZ4dTkE/camU3B17Dm9FfHC5lEKdnodMQzxg
hZSE6g/uChCfcZZSr/K9/rt8wf9JqWWkLncA9XSr2f7yOap2GPGFtVL6+m1B
9FnEL12k9HZgys1Sf/B/UrIc/LvSDPXnruznq1V0HiFe4c7O88vz2+6jXpcv
JRW3xI6GqCcWSKnjw8KFVag/F0mpYuee2DrUn4vZeZgzfocS6mul7Pnf9UnK
QzyFk1KrWHD0BvTv5Wy+Xz3d/1/97P/wn5Smfv9z8QbqazdKKUnQojUS9Yie
Usrafc1zC+p1t0ip2+4tl1f8i/9KKeNx77MrUT+9TUqfnbWyXyMetV1Kz59P
6TkQ8R5vKa3z9XY3gd6mD9u/GxY9H4L+8buk5P3otlZH5FvskdLW33NWPb8D
/k9Km7iSP2nQU/WTkp5pr8RMxOP92fMNPm2SiX7bAcwfOQ/U79IO/o/tnzVT
l/6nR/8//CelDeN+mVxRhf6zlN71nZOT0Yb4r5SOZezhNzUh/iulwxZPa8Le
I/4rpbMOM0bUv0b8l82vVVH0KdSvHpOS3flhx7eWIf7L7O0asIFQvxoupYfm
t3sWQM/3pJS693bY9gP18RFsvizFn64gvh8lpb8bZ+W/ht7wKTb/Olb9t+cg
/iulTo9NL3lCL/csm//RS61ysxH/ldKVN4Ns1yA/4ryUxOmWk6ZlI/4rpetP
EzyWZyP+y/xN969/L2Uj/islBydTa7O7iP8y/zjLren1XcR/peR2ek7QLeRb
XJOSjkr87mvQQ06QkrqxWU4O9JATpZTa9/mZT/nAf1L6XpkVpV8A/Celi+sv
z1l9H/iP/f4Bx6GhyEdKYfYHtLxMxfylSelpaLed+cXAf1JS6tD329UHwH/s
+af3LHF/CPzHxqtuWtZC/yBLSksil+sPLwH+Y/6l7MyVYciXymHnLaXnuP9+
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
Nl87S/k9tRT2ZnCUft+66iPiW8T8xUUnrkhbYY+ND5UO6Z3QD98j7Oc7ns88
jnjWLI4Or566zhvnYzabj/T5leugnzOHo8urGn/P0sP3CkfSH/v36KD/8VyO
asRTO36CnrIlG2sfq08wVNibx37+wQoP/nB8z3DUa+P2K91wftnY6ZLX9ij0
K5nP0dK8L3F9kb9qzZFPnF4nz1EKezYcmT2/sCUJ9ZK2zF/PWmpajvpFNk7q
mpD2aLTC3gKOSkcrWVzC/biQ7Z8LdhbOYxT2FrH9OTX1yTvcl3YcWW1W2WM5
VmGPjZ2tGq/uHIvvJY4utBSJgxEfW8xRj7KvTR5jFfYcOJpVNKLjyLEKe0s4
ik2ZuOHyGHxPsftmqSD6G+53R3Y/zYif+WM0vq/YeRMuOBBjprC3jPnbL3tq
vsL/Ledov5HrxlLUf7JxJ36XnWNR37mCI8eS5pie6A/jxJHbuuVbJUMV9pw5
csl48mgJ1nclRwnej55UI97JxoF1FX3mQp97FUc5n3gO8Zr4XuNow6gwI5eu
CntrOOrXuc+qk9AbWcvm23XI2xM4H2zsrHXS/UhHfM9xlBljrBMHPZV1HJ26
qJXZjPO2nqPW+s+u23HeXDka7WirPBz9w9lYRe96ahH0l9w4cvi1Ot4A9cPu
HN1PiBifg/PBY/aWvy4yQH4sn6MhtxMMM9Dvm43P7uM1T9LF9yFH1z7YrTs4
WGFPyPDEvG4tfwcr7ImY//J8rPIF/cDFHJXX3LqSgvguG88TZB4+Br1+CUcT
J20RxMKelKN7aefGddBT2JNx9KR2vV+EHr4vmf9LPJ+9BXrlbPwjV+/ogX/9
xjkKr8tSvY/ztoGjGYuuZxnhvHlwdDLU8kME8os3cnR3VX2UjhG+RzlK+xyz
Khr7ZRO7ny7pWeqi/4on82cbt80KNVHY28yRtTSuz59//crZ/I9Zu8gJ542N
U4Ldh8fivHlxFFOyfm4DzttWjqK0y7YNw/nYxt53TtUOZwuFve0cdax7eCx4
HL5vOfq7NZeXP15hbwdHwV+1rnZCPrY3R3WxN3o6TlLY28mRROrWkojvBZ//
8MTnNUaoT2DjZ+uzYm4ifruL+TOtZ3ar0Z98N/MvLcH5+jMV9vaw8/+h/rkq
vmd8Obpkbj9FGXpobNwzzyVTC/nuezlSDrpzxBz1Hn5sP49sXLvQRmFvHzs/
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
qGKx52bzkhc5IP+PyXHfvrw34n//H0Fp+AY=
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  AxesOrigin->{50., 0},
  Frame->True,
  FrameLabel->{{
     FormBox[
     "\"\\!\\(\\*SubscriptBox[\\(log\\), \\(10\\)]\\)(LCE)\"", 
      TraditionalForm], None}, {
     FormBox[
     "\"\\!\\(\\*SubscriptBox[\\(t\\), \\(din\\)]\\)\"", TraditionalForm], 
     None}},
  FrameStyle->Directive["Helvetica", 17],
  ImageSize->550,
  Method->{},
  PlotRange->{{10, 300}, {-1., 0.}},
  PlotRangeClipping->True,
  PlotRangePadding->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{
  3.600690401853594*^9, 3.600957184999035*^9, 3.604652804214353*^9, 
   3.604652861076453*^9, 3.604652929888174*^9, 3.6046529938482866`*^9, 
   3.604653069274419*^9, 3.604653116729702*^9, 3.6046531758694057`*^9, 
   3.604653243401925*^9, 3.604653422271839*^9, 3.6046534861539507`*^9, 
   3.604653540878847*^9, 3.6046536039341583`*^9, 3.6046536562254496`*^9, 
   3.6046537197019615`*^9, 3.60465377021485*^9, 3.6046538304465556`*^9, 
   3.604653896590672*^9, 3.604653995994046*^9, 3.6046540625281634`*^9, 
   3.604654139030698*^9, 3.604654242209279*^9, 3.6046543063565917`*^9, 
   3.6046544221903954`*^9, 3.6046545125613537`*^9, 3.604654569755054*^9, 
   3.604821060327445*^9, 3.604821127750763*^9, 3.6048211964064837`*^9, 
   3.604821262831401*^9, 3.6048214100332594`*^9, 3.6048214871909947`*^9, 
   3.604821635438055*^9, 3.6048217136877923`*^9, {3.604821792436731*^9, 
   3.604821820969181*^9}, 3.6048218591580477`*^9, 3.604821936487384*^9, 
   3.6048219999326954`*^9, 3.6048222615451546`*^9, 3.6048223086260376`*^9, 
   3.604822341666896*^9, 3.604822406126209*^9, 3.6048224633783092`*^9, 
   3.6048225633432846`*^9, 3.6048227102799425`*^9, 3.6048227726644526`*^9, 
   3.6048228974022713`*^9}]
}, Open  ]]
},
WindowSize->{1350, 633},
WindowMargins->{{0, Automatic}, {Automatic, 0}},
FrontEndVersion->"9.0 for Microsoft Windows (64-bit) (January 25, 2013)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[579, 22, 26398, 717, 2136, "Input"],
Cell[26980, 741, 1260, 18, 31, "Output"],
Cell[28243, 761, 1260, 18, 31, "Output"],
Cell[CellGroupData[{
Cell[29528, 783, 387, 7, 23, "Print"],
Cell[29918, 792, 393, 7, 23, "Print"],
Cell[30314, 801, 393, 7, 23, "Print"],
Cell[30710, 810, 393, 7, 23, "Print"],
Cell[31106, 819, 389, 7, 23, "Print"]
}, Open  ]],
Cell[31510, 829, 82908, 1367, 396, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)
