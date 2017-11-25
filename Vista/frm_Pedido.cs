﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Model;

namespace Vista
{
    public partial class frm_Pedido : Form
    {
        ServiceReference1.Service1Client serv = new ServiceReference1.Service1Client();
        public frm_Pedido()
        {
            InitializeComponent();

            llenarCombobox();
            llenarCampos();
        }

        private void llenarCampos()
        {
            CL_Producto pro;
            if (cbb_producto.SelectedIndex==0)
            {
                pro = serv.listaProductos().Where(x => x.Nombre_producto == "Completo Normal").First();
            }
            else
            {
                pro = serv.listaProductos().Where(x => x.Nombre_producto == cbb_producto.Text).First();
            }

            lbl_precio.Text = pro.Precio.ToString();
            lbl_stock.Text = pro.Stock.ToString();
        }

        private void llenarCombobox()
        {
            var dicProducto = new Dictionary<int, string>();
            foreach (CL_Producto tip in serv.listaProductos())
            {
                dicProducto.Add(tip.Id_producto, tip.Nombre_producto);
            }
            cbb_producto.DataSource = new BindingSource(dicProducto, null);
            cbb_producto.DisplayMember = "Value";
            cbb_producto.ValueMember = "Key";
        }

        private void cbb_producto_SelectedIndexChanged(object sender, EventArgs e)
        {

            llenarCampos();
        }
    }
}