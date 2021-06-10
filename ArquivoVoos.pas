program ArquivoVoo;
uses crt;
type
	Rg_voo = record
		NumeroVoo:integer;
		cidadeDestino:string;
		cidadeOrigem:string;
		dataPartida:string;
		dataChegada:string;
		horarioPartida:string;
		horarioChegada:string;
	end;
	file_voos = file of Rg_voo;
var
	voo:Rg_voo;
	voos:file_voos;
procedure cadastra;
begin
		assign(voos,'voos.dat');
		rewrite(voos);
		repeat
			writeln('para fechar ------- digite 0');
			writeln('Qual o n° do vôo?');
			readln(voo.NumeroVoo);
			if(voo.NumeroVoo <> 0) then
			begin
				writeln('Qual a cidade de origem do vôo?');
				readln(voo.cidadeOrigem);
				writeln('Qual a cidade de destino do vôo?');
				readln(voo.cidadeDestino);
				writeln('Qual a data de partida do vôo?');
				readln(voo.dataPartida);
				writeln('Qual o horario da partida do vôo?');
				readln(voo.horarioPartida);
				writeln('Qual a data de chegada do vôo?');
				readln(voo.dataChegada);
				writeln('Qual o horario de chegada do vôo?');
				readln(voo.horarioChegada);
				write(voos,voo);
			end;
		until voo.NumeroVoo = 0;
		close(voos);
end;

procedure listar;
begin
	//associar variavelao arquivo fisico
	assign(voos,'voos.dat');
	//abrir arquivo
	reset(voos);
	writeln('Listagem de voos');
	writeln('=-=-=-=-=-=-=-=-=-=-=');
	while not eof(voos) do
	begin
		read(voos,voo);
				writeln('Numero do vôo : ',voo.NumeroVoo);
				writeln('cidade de origem : ',voo.cidadeOrigem);
				writeln('cidade de destino : ',voo.cidadeDestino);
				writeln('data de partida : ',voo.dataPartida);
				writeln('horario de partida : ',voo.horarioPartida);
				writeln('data de chegada : ',voo.dataChegada);
				writeln('horario de chegada : ',voo.horarioChegada);
				writeln('=-=-=-=-=-=-=-=-=-=-=');
	end;
	writeln('registros : ',filesize(voos));
	close(voos);
end;

begin
	cadastra();
	listar();
end.
