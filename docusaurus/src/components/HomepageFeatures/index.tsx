import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Data Integrity',
    description: (
      <>
        Ensuring data integrity is crucial in databases to maintain accuracy and consistency of the stored data over its entire lifecycle.
      </>
    ),
  },
  {
    title: 'Scalability',
    description: (
      <>
        Scalability is essential for a database to handle increasing amounts of data and users without compromising performance.
      </>
    ),
  },
  {
    title: 'Security',
    description: (
      <>
        Security measures protect the database against unauthorized access and threats, ensuring the confidentiality and safety of data.
      </>
    ),
  },
];


function Feature({ title, description }: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
