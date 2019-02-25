' 1.�����³�ʽ�븴�Ƶ�Excel VBA ģ��(Module)��
'
' 2.��Excel��������A Column����Ҫ��������������б�
'
' 3.��Ҫת���е�xml��ʽ���ʿ��ļ�����ִ��xmlVocabulary������ĵ���λ��ΪExcel��ҳ��λ�ã���������Ϊ"����������.xml"
'
' 4.��Ҫ��������ֱ��д��Excel������ִ��xlsmVocabulary
'
' 5.�������������б���Է����ٶȣ����Լ�1000���ִ�Ż�7~8���ӷ���
'
' 6.��Ҫ�ֳɵ�Excel����������"�е����ʱ�.xlsm"

Private Type Character
    word As String
    trans As String
    phonetic As String
    tags As String
    'progress As Integer
End Type

'����е�xml��ʽ���ʿ��ļ�
Sub xmlVocabulary()

    Dim newChar As Character
    Dim R As Range
    Dim Row As Range
    Dim strOutput As String
    Dim arrBytes() As Byte

    newChar.tags = ActiveSheet.name
    ActiveSheet.Names.Add name:="NewWord", RefersTo:="=OFFSET($A$1,0,0,COUNTA($A:$A))"
    Set R = ActiveSheet.Names("NewWord").RefersToRange
    
    strOutput = "<wordbook>"
    For Each Row In R.Rows
        newChar.word = Trim(Row(1))
        Call searchWord(newChar.word, newChar.trans, newChar.phonetic)
        strOutput = strOutput & vbCrLf & "<item>"
        strOutput = strOutput & vbCrLf & "<word>" & newChar.word & "</word>"
        strOutput = strOutput & vbCrLf & "<trans><![CDATA[" & newChar.trans & "]]></trans>"
        strOutput = strOutput & vbCrLf & "<phonetic><![CDATA[" & newChar.phonetic & "]]></phonetic>"
        strOutput = strOutput & vbCrLf & "<tags>" & newChar.tags & "</tags>"
        strOutput = strOutput & vbCrLf & "<progress>1</progress>"
        strOutput = strOutput & vbCrLf & "</item>"
    Next Row
    strOutput = strOutput & vbCrLf & "</wordbook>"
    
    arrBytes = ChrW(&HFEFF) & strOutput     'д��unicode������
    
    Open Application.ActiveWorkbook.Path & "\" & newChar.tags & ".xml" For Binary As #1      '����xml��ʽ����
    Put #1, , arrBytes
    
    Close #1

End Sub

'��������д��Excel��
Sub xlsmVocabulary()

    Dim newChar As Character
    Dim R As Range
    Dim Row As Range
    Dim rr As Integer

    strTags = ActiveSheet.name
    ActiveSheet.Names.Add name:="NewWord", RefersTo:="=OFFSET($A$1,0,0,COUNTA($A:$A))"
    Set R = ActiveSheet.Names("NewWord").RefersToRange
    
    rr = 0
    
    For Each Row In R.Rows
        rr = rr + 1
        newChar.word = Trim(Row(1))
        
        Call searchWord(newChar.word, newChar.trans, newChar.phonetic)
        Worksheets(strTags).Cells(rr, 2).Value = newChar.phonetic   'ߢȡ����
        Worksheets(strTags).Cells(rr, 3).Value = newChar.trans      'ߢȡ����
        
    Next Row
    
End Sub

    
    Sub searchWord(tmpWord As String, tmpTrans As String, tmpPhonetic As String)
    'http://dict.youdao.com/search?q=����&keyfrom=dict.index
        Dim XH As Object
        Dim s() As String
        Dim str_tmp As String
        Dim str_base As String
        
        tmpTrans = ""
        tmpPhonetic = ""

        '������ҳ
        Set XH = CreateObject("Microsoft.XMLHTTP")
        On Error Resume Next
        XH.Open "get", "http://dict.youdao.com/search?q=" & tmpWord & "&keyfrom=dict.index", False
        XH.send
        On Error Resume Next
        str_base = XH.responseText
        XH.Close
        Set XH = Nothing
        
        str_base = Split(Split(XH.responseText, "<div id=""webTrans"" class=""trans-wrapper trans-tab"">")(0), "<span class=""keyword"">")(1)

        'ߢȡ����
        If UBound(Split(str_base, "<span class=""pronounce"">��")) = 1 Then
        '��ʽ����
            tmpPhonetic = Split((Split(Split(str_base, "<span class=""pronounce"">��")(1), "<span class=""phonetic"">")(1)), "</span>")(0)
            On Error Resume Next
        Else
            tmpPhonetic = Split((Split(str_base, "<span class=""phonetic"">")(1)), "</span>")(0)
            On Error Resume Next
        End If

        'ߢȡ���ķ���
        str_tmp = Split((Split(str_base, "<div class=""trans-container"">")(1)), "</div>")(0)
        str_tmp = Split((Split(str_tmp, "<ul>")(1)), "</ul>")(0)
        s = Split(str_tmp, "<li>")
        tmpTrans = Split(s(LBound(s) + 1), "</li")(0)
        For i = LBound(s) + 2 To UBound(s)
            tmpTrans = tmpTrans & Chr(10) & Split(s(i), "</li")(0)
        Next

    End Sub