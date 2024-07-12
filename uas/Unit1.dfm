object Form1: TForm1
  Left = 192
  Top = 125
  Width = 999
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object l1: TLabel
    Left = 128
    Top = 32
    Width = 17
    Height = 13
    Caption = 'NIK'
  end
  object l2: TLabel
    Left = 128
    Top = 72
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object l3: TLabel
    Left = 128
    Top = 104
    Width = 38
    Height = 13
    Caption = 'TELPON'
  end
  object l4: TLabel
    Left = 124
    Top = 184
    Width = 40
    Height = 13
    Caption = 'ALAMAT'
  end
  object l5: TLabel
    Left = 128
    Top = 212
    Width = 41
    Height = 13
    Caption = 'MEMBER'
  end
  object l6: TLabel
    Left = 128
    Top = 148
    Width = 30
    Height = 13
    Caption = 'EMAIL'
  end
  object l7: TLabel
    Left = 204
    Top = 404
    Width = 79
    Height = 13
    Caption = 'MASUKAN NAME'
  end
  object e_1: TEdit
    Left = 168
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'e_1'
  end
  object e_2: TEdit
    Left = 172
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'e_1'
  end
  object e_3: TEdit
    Left = 176
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'e_1'
  end
  object e_4: TEdit
    Left = 184
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'e_1'
  end
  object e_5: TEdit
    Left = 184
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object cbb1: TComboBox
    Left = 188
    Top = 216
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      'YES'
      'NO')
  end
  object b1: TButton
    Left = 356
    Top = 120
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 6
    OnClick = b1Click
  end
  object b2: TButton
    Left = 448
    Top = 120
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 7
    OnClick = b2Click
  end
  object b3: TButton
    Left = 548
    Top = 120
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 8
    OnClick = b3Click
  end
  object b4: TButton
    Left = 652
    Top = 116
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 9
    OnClick = b4Click
  end
  object b5: TButton
    Left = 748
    Top = 120
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 10
    OnClick = b5Click
  end
  object dbgrd1: TDBGrid
    Left = 340
    Top = 152
    Width = 617
    Height = 237
    DataSource = ds1
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nik'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telp'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alamat'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'member'
        Visible = True
      end>
  end
  object e_6: TEdit
    Left = 304
    Top = 400
    Width = 229
    Height = 21
    TabOrder = 12
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 540
    Top = 64
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    HostName = 'Localhost'
    Port = 3306
    Database = 'penjualan1'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\uas\libmysql.dll'
    Left = 428
    Top = 64
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from kustomer'
      '')
    Params = <>
    Left = 476
    Top = 60
  end
end
