unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    e_1: TEdit;
    e_2: TEdit;
    e_3: TEdit;
    e_4: TEdit;
    e_5: TEdit;
    cbb1: TComboBox;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    l7: TLabel;
    e_6: TEdit;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure posisiawal;
    procedure b5Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   id:string;

implementation

{$R *.dfm}

procedure TForm1.b1Click(Sender: TObject);
begin
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
e_5.Enabled:= True;
cbb1.Enabled:= True;
e_6.Enabled:= True;
end;

procedure TForm1.b2Click(Sender: TObject);
begin
if e_1.Text = '' then
begin
  ShowMessage('ID BELUM DIISI DENGAN BENAR');
end
else if e_2.Text = '' then
begin
  ShowMessage('NIK BELUM DIISI DENGAN BENAR');
end
else if e_3.Text = '' then
begin
  ShowMessage('NAMA BELUM DIISI DENGAN BENAR');
end
else if e_4.Text = '' then
begin
  ShowMessage('NOMOR TELEPON BELUM SESUAI');
end
else if e_5.Text = '' then
begin
  ShowMessage('EMAIL BELUM SESUAI');
end
else if cbb1.Text = '' then
begin
  ShowMessage('MEMBER BELUM DIISI DENGAN BENAR');
end
else if Form1.zqry1.Locate('nik', e_1.Text, []) then
begin
  ShowMessage('DATA SUDAH ADA DALAM SISTEM');
end
else
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('INSERT INTO kustomer (nik, nama, telp, email, alamat, member) VALUES (:nik, :nama, :telp, :email, :alamat, :member)');
  zqry1.ParamByName('nik').AsString := e_2.Text;
  zqry1.ParamByName('nama').AsString := e_3.Text;
  zqry1.ParamByName('telp').AsString := e_4.Text;
  zqry1.ParamByName('email').AsString := e_5.Text;
  zqry1.ParamByName('alamat').AsString := e_6.Text;
  zqry1.ParamByName('member').AsString := cbb1.Text;
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('SELECT * FROM kustomer');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN!');
end;

end;

procedure TForm1.b3Click(Sender: TObject);
begin
 if (e_1.Text = '') or (e_2.Text = '') or (e_3.Text = '') or (e_4.Text = '') or (e_5.Text = '') then
begin
  ShowMessage('INPUTAN WAJIB DIISI!');
end
else if Form1.zqry1.Locate('nik', e_1.Text, []) then
begin
  ShowMessage('DATA TIDAK ADA PERUBAHAN');
end
else
begin
  ShowMessage('DATA BERHASIL DIUPDATE!');
  
  zqry1.SQL.Clear;
  zqry1.SQL.Add('UPDATE kustomer SET nik = :nik, nama = :nama, telp = :telp, email = :email, alamat = :alamat WHERE nik = :old_nik');
  zqry1.ParamByName('nik').AsString := e_1.Text;
  zqry1.ParamByName('nama').AsString := e_2.Text;
  zqry1.ParamByName('telp').AsString := e_3.Text;
  zqry1.ParamByName('email').AsString := e_4.Text;
  zqry1.ParamByName('alamat').AsString := e_5.Text;
  zqry1.ParamByName('old_nik').AsString := zqry1.FieldByName('nik').AsString;
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('SELECT * FROM kustomer');
  zqry1.Open;
end;


end;

procedure TForm1.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from kustomer where id="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from kustomer');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
end else
begin
 ShowMessage('DATA BATAL DIHAPUS');

end


end;

procedure TForm1.b5Click(Sender: TObject);
begin
 posisiawal;
end;

procedure TForm1.posisiawal;
begin
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
e_1.Enabled:= false;
e_2.Enabled:= false;
e_3.Enabled:= false;
e_4.Enabled:= false;
e_5.Enabled:= false;
cbb1.Enabled:= false;
end;


procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
   id:= zqry1.Fields[0].AsString;
e_2.Text:= zqry1.Fields[1].AsString;
e_3.Text:= zqry1.Fields[2].AsString;
e_4.Text:= zqry1.Fields[3].AsString;
e_5.Text:= zqry1.Fields[4].AsString;
cbb1.Text:= zqry1.Fields[5].AsString;



e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
e_5.Enabled:= True;
cbb1.Enabled:= True;


b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
end;

end.
