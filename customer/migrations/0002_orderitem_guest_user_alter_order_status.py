# Generated by Django 4.0.2 on 2022-02-22 16:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderitem',
            name='guest_user',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('Delivered', 'Delivered'), ('Packed', 'Packed'), ('Canceled', 'Canceled'), ('Return', 'Return')], default='Processing', max_length=100),
        ),
    ]
