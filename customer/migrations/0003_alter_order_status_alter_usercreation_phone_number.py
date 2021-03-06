# Generated by Django 4.0.2 on 2022-02-23 05:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0002_orderitem_guest_user_alter_order_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('Packed', 'Packed'), ('Delivered', 'Delivered'), ('Canceled', 'Canceled'), ('Return', 'Return')], default='Processing', max_length=100),
        ),
        migrations.AlterField(
            model_name='usercreation',
            name='phone_number',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]
