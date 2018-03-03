import json
from django.http import JsonResponse
from rest_framework.pagination import PageNumberPagination
from rest_framework.views import APIView

from app.product.models import Product
from app.product.serializers import ProductSerializer


class ProductList(APIView):
    pagination_class = PageNumberPagination

    def get(self, request, format=None):
        product = Product.objects.all().using('default').order_by('id')
        paginator = PageNumberPagination()
        paginator.max_page_size = 100
        paginator.page_size_query_param = 'page_size'

        result_page = paginator.paginate_queryset(product, request)
        serializer = ProductSerializer(result_page, many=True, context={'request': request})

        current_page = paginator.page.number
        total_pages = int(str(paginator.page).split(" ")[3].split(">")[0])
        page_size = len(serializer.data)
        previous_page = str(paginator.get_previous_link())
        next_page = str(paginator.get_next_link())

        return JsonResponse(data={'page_size': page_size,
                                  'results': serializer.data,
                                  'next_page': next_page,
                                  'previous_page': previous_page,
                                  'current_page': current_page,
                                  'total_pages': total_pages
                                  },
                            status=200,
                            safe=False)
