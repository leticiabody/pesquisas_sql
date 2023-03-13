show databases;
use lojacoisas;
select * from produto;
/*1 - Listar o nome do cliente, email e nome da cidade.*/
select cliente.nome, cliente.email, cidade.nome from cliente inner join cidade on cliente.idCidadeFK = cidade.idcidade;

/*2 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades do estado de SP.*/
select cliente.nome, cliente.email, cidade.nome, estado.nome from cliente inner join cidade on cliente.idCidadeFK = cidade.idcidade inner join estado on estado.idEstado = estado.idEstado where estado.nome = 'sp';

/*3 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades que tenham a vogal "O" no nome do cliente.*/
select cliente.nome as cliente, cliente.email, cidade.nome as cidade, estado.nome as estado from cliente inner join cidade on
cliente.idCidadeFK = cidade.idCidade inner join estado on cliente.idEstadoFK = estado.idEstado where cliente.nome like '%o%';

/*4 - Listar o nome do produto e nome da marca dos produtos que custem entre 1000 e 3000 reais.  :)Consegui! */
select produto.nome as preco, marca.nome as marca, produto.preco from produto inner join marca 
on produto.idMarcaFK = marca.idMarca where produto.preco >= 1000 and produto.preco <= 3000;

/*5 - Listar o nome do produto, nome da marca e nome da categoria dos produtos que tenham a letra "e" no nome do produto.  :)Consegui!*/
select produto.nome, marca.nome as marca, categoria.nome as categoria from produto inner join marca 
on produto.idMarcaFK = marca.idMarca inner join categoria on produto.idCategoriaFK = categoria.idCategoria  where produto.nome like '%e%';

/*6 - Listar o número do pedido, a data do pedido e nome do cliente dos pedidos com realizados no mês 08/2016. */
select pedido.idpedido, pedido.data_pedido, cliente.nome from cliente inner join pedido 
on cliente.idcliente = pedido.idclientefk where pedido.data_pedido >= '2016-08-01' and pedido.data_pedido <= '2016-08-31'; 

/*7 - Listar o número do pedido, a data do pedido, nome do cliente e nome do vendedor dos pedidos com realizados no mês 07/2016.*/
select pedido.idPedido, pedido.data_pedido, cliente.nome as cliente, vendedor.nome as vendedor from pedido inner join cliente 
on cliente.idcliente = pedido.idclientefk inner join vendedor on pedido.idvendedorfk = vendedor.idvendedor where pedido.data_pedido >= '2016-07-01' and pedido.data_pedido <= '2016-07-30';

/*8 - Listar os nome e preço dos produtos comprados pelo cliente de id=1 */
select pedido.idPedido, pedido.data_pedido, cliente.nome as cliente, vendedor.nome as vendedor from pedido inner join cliente 
on cliente.idcliente = pedido.idclientefk inner join vendedor on pedido.idvendedorfk = vendedor.idvendedor where pedido.data_pedido >= '2016-07-01' and pedido.data_pedido <= '2016-07-30';

/*9 - Listar o número do pedido e o nome clientes que possuem pedidos e também dos que não possuem pedidos. */
select pedido.idpedido, cliente.nome from cliente left join pedido on cliente.idcliente = pedido.idclientefk; 

/*10 - Listar o nome, preço, nome da categoria e nome da marca do produto mais caro. */
select categoria.nome as categoria, produto.preco, marca.nome from produto inner join categoria  
on categoria.idcategoria = produto.idcategoriafk inner join marca  
on produto.idmarcafk = marca.idmarca where produto.preco = (select max(produto.preco) from produto );

/*11 - Listar o número do pedido, valor total e nome do cliente do pedido mais caro.*/
select itens_pedido.iditens as itens_pedido, itens_pedido.valor_total, cliente.nome as cliente 
from itens_pedido 
inner join pedido on itens_pedido.idpedidofk = pedido.idpedido 
inner join cliente on pedido.idclientefk = cliente.idcliente order by itens_pedido.valor_total desc; 

/*12 - Listar o número do pedido, valor total e nome do vendedor do pedido mais barato.*/
select pedido.idpedido as pedido, itens_pedido.valor_total as valor_Total, vendedor.nome as vendedor 
from pedido 
inner join vendedor on pedido.idvendedorfk = vendedor.idvendedor 
inner join itens_pedido on itens_pedido.idpedidofk = pedido.idpedido order by valor_total;

 