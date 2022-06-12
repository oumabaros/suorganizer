# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20220605_0926'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='post',
            options={'verbose_name': 'blog_post', 'ordering': ['-pub_date', 'title'], 'get_latest_by': 'pub_date'},
        ),
        migrations.AlterField(
            model_name='post',
            name='slug',
            field=models.SlugField(unique_for_month='pub_date', help_text='A Label for URL config', max_length=63),
        ),
    ]
