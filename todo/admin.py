from django.contrib import admin
from .models import Task, Tag


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ("nome",)
    search_fields = ("nome",)


@admin.register(Task)
class TaskAdmin(admin.ModelAdmin):
    list_display = ("titulo", "concluida", "criado_em")
    list_filter = ("concluida", "tags")
    search_fields = ("titulo", "descricao")
    filter_horizontal = ("tags",)
