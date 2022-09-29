import { FeatureSchemaDefinition } from '@mystiq/schema-types'
const news: FeatureSchemaDefinition = {
    namespace: 'news',
    variants:{
        card: [{
            title: 'News Summary Card',
            value: 'summary',
        }]
    }
};

export default news