%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%       GRUPO NUM: 
%       ALUNOS: 
%
%               ATENCAO: NAO USAR ACENTOS OU CEDILHAS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ESCREVER AQUI O CODIGO DO PROJECTO DE LP 2013/2014

%-------------------------------------------------------------------%
			%% Projecto Metaforms %%
		 %% Lógica para Programação 2011/2012 %%
			    %% Grupo 55 %%
%-------------------------------------------------------------------%


%-------------------------------------------------------------------%
			%% Peca(forma,cor) %%
%-------------------------------------------------------------------%
% Corresponde a cada peça do tabuleiro 3x3, cada uma com uma forma
% geométrica e uma cor.

peca(triangulo,azul).
peca(triangulo,amarelo).
peca(triangulo,vermelho).
peca(circulo,azul).
peca(circulo,amarelo).
peca(circulo,vermelho).
peca(quadrado,azul).
peca(quadrado,amarelo).
peca(quadrado,vermelho).



%-------------------------------------------------------------------%
	    %% coloca(Peca,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça na linha Linha e Coluna coluna na lista Tabuleiro. A
% lista Tabuleiro contém 9 posições, cada uma definida por um par
% (Linha,coluna)

coloca(Peca,top,left,[Peca,_,_,_,_,_,_,_,_]).
coloca(Peca,top,middle,[_,Peca,_,_,_,_,_,_,_]).
coloca(Peca,top,right,[_,_,Peca,_,_,_,_,_,_]).
coloca(Peca,center,left,[_,_,_,Peca,_,_,_,_,_]).
coloca(Peca,center,middle,[_,_,_,_,Peca,_,_,_,_]).
coloca(Peca,center,right,[_,_,_,_,_,Peca,_,_,_]).
coloca(Peca,bottom,left,[_,_,_,_,_,_,Peca,_,_]).
coloca(Peca,bottom,middle,[_,_,_,_,_,_,_,Peca,_]).
coloca(Peca,bottom,right,[_,_,_,_,_,_,_,_,Peca]).




%-------------------------------------------------------------------%
	    %% quadrado(Peca,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha,Coluna) de um quadrado 2x2 que
% pode estar em qualquer local do tabuleiro

quadrado(Peca,Linha,Coluna,Tabuleiro):-
	coloca(Peca,Linha,Coluna,Tabuleiro);
	coloca(Peca,Linha,middle,Tabuleiro);
	coloca(Peca,center,Coluna,Tabuleiro);
	coloca(Peca,center,middle,Tabuleiro).



%-------------------------------------------------------------------%
      %% rectanguloVertical(Peca,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha,Coluna) de um rectangulo 3x2 que
% pode estar em qualquer local do tabuleiro

rectanguloVertical(Peca,Linha,Coluna,Tabuleiro):-
	coloca(Peca,Linha,Coluna,Tabuleiro);
	coloca(Peca,Linha,middle,Tabuleiro).



%-------------------------------------------------------------------%
      %% rectanguloHorizontal(Peca,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha,Coluna) de um rectangulo 2x3 que
% pode estar em qualquer local do tabuleiro

rectanguloHorizontal(Peca,Linha,Coluna,Tabuleiro):-
	coloca(Peca,Linha,Coluna,Tabuleiro);
	coloca(Peca,center,Coluna,Tabuleiro).



%-------------------------------------------------------------------%
        %% linhaDuplaHorizontal(Peca,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Coluna) de uma linha com 2 colunas que
% pode estar em qualquer local do tabuleiro.

linhaDuplaHorizontal(Peca,Coluna,Tabuleiro):-
	linhaTriplaHorizontal(Peca,Coluna,Tabuleiro);
	linhaTriplaHorizontal(Peca,middle,Tabuleiro).



%-------------------------------------------------------------------%
        %% linhaDuplaVertical(Peca,Linha,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha) de uma Coluna com 2 linhas que
% pode estar em qualquer local do tabuleiro.

linhaDuplaVertical(Peca,Linha,Tabuleiro):-
	linhaTriplaVertical(Peca,Linha,Tabuleiro);
	linhaTriplaVertical(Peca,center,Tabuleiro).



%-------------------------------------------------------------------%
        %% linhaTriplaHorizontal(Peca,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Coluna) de uma linha do tabuleiro que
% pode estar em qualquer local do tabuleiro.

linhaTriplaHorizontal(Peca,Coluna,Tabuleiro):-
	coloca(Peca,top,Coluna,Tabuleiro);
	coloca(Peca,center,Coluna,Tabuleiro);
	coloca(Peca,bottom,Coluna,Tabuleiro).



%-------------------------------------------------------------------%
        %% linhaTriplaVertical(Peca,Linha,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha) de uma Coluna do tabuleiro que
% pode estar em qualquer local do tabuleiro.

linhaTriplaVertical(Peca,Linha,Tabuleiro):-
	coloca(Peca,Linha,left,Tabuleiro);
	coloca(Peca,Linha,middle,Tabuleiro);
	coloca(Peca,Linha,right,Tabuleiro).


%-------------------------------------------------------------------%
        %% colocaAuxiliar(Peca,Lista,Linha, Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha,Coluna) do tabuleiro, se essa
% posição não estiver na lista Lista.

colocaAuxiliar(Peca, Lista, Linha, Coluna, Tabuleiro):-
	\+ member((Linha, Coluna), Lista),
	coloca(Peca,Linha,Coluna,Tabuleiro).



%-------------------------------------------------------------------%
	       %% matrizNeg(Peca,Lista,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição do Tabuleiro que não seja nenhuma das
% que estão na Lista lista. Este predicado indica-nos onde não deve ser
% colocada uma peca no tabuleiro.

matrizNeg(Peca, Lista, Tabuleiro):-
	colocaAuxiliar(Peca, Lista, top, left, Tabuleiro);
	colocaAuxiliar(Peca, Lista, top, middle, Tabuleiro);
	colocaAuxiliar(Peca, Lista, top, right, Tabuleiro);
	colocaAuxiliar(Peca, Lista, center, left, Tabuleiro);
	colocaAuxiliar(Peca, Lista, center, middle, Tabuleiro);
	colocaAuxiliar(Peca, Lista, center, right, Tabuleiro);
	colocaAuxiliar(Peca, Lista, bottom, left, Tabuleiro);
	colocaAuxiliar(Peca, Lista, bottom, middle, Tabuleiro);
	colocaAuxiliar(Peca, Lista, bottom, right, Tabuleiro).


%-------------------------------------------------------------------%
	    %% quadrado(Peca,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha,Coluna) de um quadrado 2x2 que
% pode estar em qualquer local do tabuleiro, se essa posição
% (Linha,Coluna) não se encontrar na lista Lista.

quadradoNegaAuxiliar(Peca, Lista, Linha, Coluna, Tabuleiro):-
	\+ member((Linha, Coluna), Lista),
	quadrado(Peca,Linha,Coluna,Tabuleiro).



%-------------------------------------------------------------------%
	    %% quadradoNeg(Peca,Lista,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição que não corresponda a nenhuma
% posição (Linha,Coluna) da lista Lista de um quadrado 2x2 que pode
% estar em qualquer local do tabuleiro.

quadradoNeg(Peca, Lista, Tabuleiro):-
	quadradoNegaAuxiliar(Peca, Lista, top, left, Tabuleiro);
	quadradoNegaAuxiliar(Peca, Lista, top, right, Tabuleiro);
	quadradoNegaAuxiliar(Peca, Lista, bottom, left, Tabuleiro);
	quadradoNegaAuxiliar(Peca, Lista, bottom, right, Tabuleiro).



%-------------------------------------------------------------------%
  %% rectanguloVerticalNegAux(Peca,Lista,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha,Coluna) de um rectangulo 3x2 que
% pode estar em qualquer local do tabuleiro, se esta posição
% (Linha,Coluna) não pertencer à lista Lista.

rectanguloVerticalNegAux(Peca, Lista, Linha, Coluna, Tabuleiro):-
	\+ member((Linha, Coluna), Lista),
	rectanguloVertical(Peca,Linha,Coluna,Tabuleiro).


%-------------------------------------------------------------------%
    %% rectanguloVerticalNeg(Peca,Lista,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição  que não corresponda a nenhuma
% posição (Linha,Coluna) da lista Lista de um rectangulo 3x2 que pode
% estar em qualquer local do tabuleiro

rectanguloVerticalNeg(Peca,Lista,Tabuleiro):-
	rectanguloVerticalNegAux(Peca, Lista, top, left, Tabuleiro);
	rectanguloVerticalNegAux(Peca, Lista, center, left, Tabuleiro);
	rectanguloVerticalNegAux(Peca, Lista, bottom, left, Tabuleiro);
	rectanguloVerticalNegAux(Peca, Lista, top, right, Tabuleiro);
	rectanguloVerticalNegAux(Peca, Lista, center, right, Tabuleiro);
	rectanguloVerticalNegAux(Peca, Lista, bottom, right, Tabuleiro).


%-------------------------------------------------------------------%
  %% rectanguloHorizontalNegAux(Peca,Lista,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha,Coluna) de um rectangulo 2x3 que
% pode estar em qualquer local do tabuleiro, se esta posição
% (Linha,Coluna) não pertencer à lista Lista.

rectanguloHorizontalNegAux(Peca, Lista, Linha, Coluna, Tabuleiro):-
	\+ member((Linha, Coluna), Lista),
	rectanguloHorizontal(Peca,Linha,Coluna,Tabuleiro).


%-------------------------------------------------------------------%
   %% rectanguloHorizontalNeg(Peca,Lista,Linha,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição  que não corresponda a nenhuma
% posição (Linha,Coluna) da lista Lista de um rectangulo 2x3 que pode
% estar em qualquer local do tabuleiro

rectanguloHorizontalNeg(Peca,Lista,Tabuleiro):-
	rectanguloHorizontalNegAux(Peca, Lista, top, left, Tabuleiro);
	rectanguloHorizontalNegAux(Peca, Lista, top, middle, Tabuleiro);
	rectanguloHorizontalNegAux(Peca, Lista, top, right, Tabuleiro);
	rectanguloHorizontalNegAux(Peca, Lista, bottom, left, Tabuleiro);
	rectanguloHorizontalNegAux(Peca, Lista, bottom, middle, Tabuleiro);
	rectanguloHorizontalNegAux(Peca, Lista, bottom, right, Tabuleiro).


%-------------------------------------------------------------------%
    %% linhaDuplaHorizontalNegAux(Peca,Lista,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Coluna) de uma linha com 2 colunas se a
% posição (Coluna) não estiver na lista Lista.

linhaDuplaHorizontalNegAux(Peca, Lista, Coluna, Tabuleiro):-
	\+ member(Coluna, Lista),
	linhaDuplaHorizontal(Peca, Coluna, Tabuleiro).


%-------------------------------------------------------------------%
      %% linhaDuplaHorizontalNeg(Peca,Lista,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição que não corresponda a nenhuma posição
% (Coluna) da lista Lista de uma linha com 2 colunas que pode estar em
% qualquer local do tabuleiro

linhaDuplaHorizontalNeg(Peca, Lista, Tabuleiro):-
	linhaDuplaHorizontalNegAux(Peca, Lista, left, Tabuleiro);
	linhaDuplaHorizontalNegAux(Peca, Lista, right, Tabuleiro).


%-------------------------------------------------------------------%
     %% linhaDuplaVerticalNegAux(Peca,Lista,Linha,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha) de uma coluna com 2 linhas se
% a posição (Linha) não estiver na lista Lista.

linhaDuplaVerticalNegAux(Peca, Lista, Linha, Tabuleiro):-
	\+ member(Linha, Lista),
	linhaDuplaVertical(Peca, Linha, Tabuleiro).


%-------------------------------------------------------------------%
      %% linhaDuplaVertigalNeg(Peca,Lista,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição que não corresponda a nenhuma posição
% (Linha,Coluna) da lista Lista de uma coluna com 2 linhas que pode
% estar em qualquer parte do tabuleiro.

linhaDuplaVerticalNeg(Peca, Lista, Tabuleiro):-
	linhaDuplaVerticalNegAux(Peca, Lista, top, Tabuleiro);
	linhaDuplaVerticalNegAux(Peca, Lista, bottom, Tabuleiro).



%-------------------------------------------------------------------%
     %% linhaTriplaVerticalNegAux(Peca,Lista,Linha,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Linha) de uma coluna com 3 linhas se
% a posição (Linha) não estiver na lista Lista.

linhaTriplaVerticalNegAux(Peca, Lista, Linha, Tabuleiro):-
	\+ member(Linha, Lista),
	linhaTriplaVertical(Peca, Linha, Tabuleiro).


%-------------------------------------------------------------------%
      %% linhaTriplaVertigalNeg(Peca,Lista,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição que não corresponda a nenhuma posição
% (Linha,Coluna) da lista Lista de uma coluna com 3 linhas que pode
% estar em qualquer parte do tabuleiro.

linhaTriplaVerticalNeg(Peca, Lista, Tabuleiro):-
	linhaTriplaVerticalNegAux(Peca, Lista, top, Tabuleiro);
	linhaTriplaVerticalNegAux(Peca, Lista, bottom, Tabuleiro);
	linhaTriplaVerticalNegAux(Peca, Lista, center, Tabuleiro).


%-------------------------------------------------------------------%
    %% linhaTriplaHorizontalNegAux(Peca,Lista,Coluna,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca na posição (Coluna) de uma linha com 3 colunas se a
% posição (Coluna) não estiver na lista Lista.

linhaTriplaHorizontalNegAux(Peca, Lista, Coluna, Tabuleiro):-
	\+ member(Coluna, Lista),
	linhaTriplaHorizontal(Peca, Coluna, Tabuleiro).


%-------------------------------------------------------------------%
      %% linhaTriplaHorizontalNeg(Peca,Lista,Tabuleiro) %%
%-------------------------------------------------------------------%
% Coloca a peça Peca numa posição que não corresponda a nenhuma posição
% (Coluna) da lista Lista de uma linha com 3 colunas que pode estar em
% qualquer local do tabuleiro

linhaTriplaHorizontalNeg(Peca, Lista, Tabuleiro):-
	linhaTriplaHorizontalNegAux(Peca, Lista, left, Tabuleiro);
	linhaTriplaHorizontalNegAux(Peca, Lista, middle, Tabuleiro);
	linhaTriplaHorizontalNegAux(Peca, Lista, right, Tabuleiro).







