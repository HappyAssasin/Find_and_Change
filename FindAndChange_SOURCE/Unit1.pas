unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

const
  bufsize = 262144;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure log(s: String);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure findandChage(fn: string; fd, cd: string);
    procedure strtobyte(s: string; var res: array of byte);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not fileexists(Edit1.Text) then
  begin
    log(Edit1.Text + ' файл не доступен');
    Exit;
  end;

  Edit2.Text := trim(Edit2.Text);
  Edit3.Text := trim(Edit3.Text);

  if trim(Edit2.Text) = '' then
  begin
    log('Что ищем не может быть пустым');
    Exit;
  end;
  if (Edit3.Text) = '' then
  begin
    Edit3.Text := Edit2.Text;
    log('Заполняем на что меняем');
  end;
  if length(Edit2.Text) <> length(Edit3.Text) then
  begin
    log('Длины должны совпадать!');
    Exit;
  end;
  Panel1.Enabled := false;
  Panel1.Visible := false;
  findandChage(Edit1.Text, Edit2.Text, Edit3.Text);
  Panel1.Visible := true;
  Panel1.Enabled := true;
end;

procedure TForm1.findandChage(fn, fd, cd: string);
var
  fn2: string;
  f, f2: TFileStream;
  i, j, ii, n, q, count: Integer;
  b, b1: Boolean;
  Buf: Array [0 .. bufsize] Of byte;
  FindData: Array Of byte;
  ChangeData: Array Of byte;
begin
  log('Обрабатываем ' + fn);
  n := length(fd);
  q := 0;
  log('Что ищем ');
  SetLength(FindData, n);
  strtobyte(fd, FindData);
  log('На что заменяем ');
  SetLength(ChangeData, n);
  strtobyte(cd, ChangeData);
  log('Начинаем поиск и замену');
  fn2 := fn;
  insert('_result', fn2, lastdelimiter('.', fn2));
  f := TFileStream.Create(fn, fmOpenReadWrite);
  f2 := TFileStream.Create(fn2, fmCreate);
  f.Position := 0;
  log('Размер ' + inttostr(f.Size));
  while f.Position < f.Size do
  begin
    count := f.Read(Buf, bufsize);
    if (q mod (32) = 0) or (q = 0) then
    begin
      StatusBar1.Panels[0].Text := 'Обработано ' + inttostr(q) +
        ' блоков (256K)';
      StatusBar1.Invalidate;
      application.ProcessMessages;
      sleep(1);
    end;
    inc(q);
    For i := 0 To (length(Buf) - n) Do
    Begin
      application.ProcessMessages;
      if Buf[i] = FindData[0] then
      begin
        b1 := true;
        j := 0;
        b := true;
        while b do
        begin
          If Buf[i + j] <> FindData[j] Then
          begin
            b := false;
            b1 := false;
          end;
          inc(j);
          if j >= n then
            b := false;
        end;

        if b1 then
        begin
          log('Cовпадение по адресу (HEX) ' + intTohex(f.Position + i, 8));
          For j := 0 To n - 1 Do
            Buf[i + j] := ChangeData[j];
        end;
      end;
    end;
    f2.Write(Buf, count);
  end;
  StatusBar1.Panels[0].Text := 'Обработано ' + inttostr(q) + ' блоков (256K)';
  StatusBar1.Invalidate;
  application.ProcessMessages;
  log('Обработка завершена');
  f2.Free;
  f.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Memo1.Clear;
  log('Запуск программы');
end;

procedure TForm1.log(s: String);
begin
  s := '[' + timeTostr(now) + '] ' + trim(s);
  Memo1.Lines.Add(s);
  application.ProcessMessages;
  sleep(50);
end;

procedure TForm1.strtobyte(s: string; var res: array of byte);
var
  n, i: Integer;
  q: string;
begin
  n := length(s);
  for i := 0 to n - 1 do
  begin
    res[i] := ord(s[i + 1]);
  end;
  q := '';
  for i := 0 to n - 1 do
    q := q + '$' + intTohex(res[i], 2) + ' ';
  log(s + ' -> ' + q);
end;

end.
